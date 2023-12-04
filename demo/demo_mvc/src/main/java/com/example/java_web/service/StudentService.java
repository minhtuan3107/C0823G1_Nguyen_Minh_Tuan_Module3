package com.example.java_web.service;

import com.example.java_web.model.Student;
import com.example.java_web.repository.IStudentRepository;
import com.example.java_web.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService{
    private IStudentRepository iStudentRepository = new StudentRepository();
    @Override
    public List<Student> showListStudent() {
        return iStudentRepository.showListStudent();
    }

    @Override
    public void addNewStudent(Student student) {
        iStudentRepository.addNewStudent(student);
    }
}
