package com.example.java_web.repository;

import com.example.java_web.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> showListStudent();
    void addNewStudent(Student student);
    void deleteStudent(int id);
}
