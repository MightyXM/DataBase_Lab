package com.example.mpdemo.controller;

import com.example.mpdemo.entity.Student;
import com.example.mpdemo.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StudentController {
    @Autowired
    private StudentMapper studentMapper;
    @GetMapping("/student")
    public List query(){
        List<Student> list = studentMapper.selectList(null);
        return list;
    }
}
