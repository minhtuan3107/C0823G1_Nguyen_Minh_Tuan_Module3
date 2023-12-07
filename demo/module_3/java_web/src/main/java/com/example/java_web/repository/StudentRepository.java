package com.example.java_web.repository;

import com.example.java_web.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT = "select * from `student`";
    private final String SELECT_SP = "call find_all();";
    private final String DELETE = "delete from `student` where id = ?;";
    private final String INSERT = "insert into student(name,gender,point)" +
            "values (?,?,?)";
    private final String INSERT_SP = "call insert_student(?,?,?)";

    @Override
    public List<Student> showListStudent() {
        List<Student> list = new ArrayList<>();
        // kết nối DB lấy kết quả trả về thêm vào list
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(SELECT_SP);
            ResultSet resultSet = callableStatement.executeQuery();
            int id;
            String name;
            boolean gender;
            double point;
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                gender = resultSet.getBoolean("gender");
                point = resultSet.getDouble("point");
                list.add(new Student(id, name, gender, point));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void addNewStudent(Student student) {
        Connection connection = BaseRepository.getConnection();
        Savepoint savepoint= null;
        try {
            connection.setAutoCommit(false);
            savepoint = connection.setSavepoint("sp1");
            CallableStatement callableStatement
                    = connection.prepareCall(INSERT_SP);
            callableStatement.setString(1, student.getName());
            callableStatement.setBoolean(2, student.isGender());
            callableStatement.setDouble(3, student.getPoint());
            callableStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                System.out.println("Lỗi transaction");
                connection.rollback(savepoint);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }

    @Override
    public void deleteStudent(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement
                    = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
