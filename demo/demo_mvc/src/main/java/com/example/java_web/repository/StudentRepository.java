package com.example.java_web.repository;

import com.example.java_web.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository{
    private static List<Student> list = new ArrayList<>();
    static {
        list.add(new Student(1,"Nhật Bảo", true, 7));
        list.add(new Student(2,"Văn Độ", true, 6));
        list.add(new Student(3,"Tiểu Vi", false, 5));
        list.add(new Student(4,"Tất Quyền", true, 4));
    }
    @Override
    public List<Student> showListStudent() {
        return list;
    }

    @Override
    public void addNewStudent(Student student) {
        list.add(student);
    }
}
