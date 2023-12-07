package com.example.java_web.service;

import com.example.java_web.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> showListStudent();
    void addNewStudent(Student student);
    void deleteStudent(int id);
}
