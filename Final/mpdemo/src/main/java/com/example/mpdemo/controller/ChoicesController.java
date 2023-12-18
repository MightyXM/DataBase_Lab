package com.example.mpdemo.controller;

import com.example.mpdemo.entity.Choices;
import com.example.mpdemo.mapper.ChoicesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChoicesController {
    @Autowired
    private ChoicesMapper choicesMapper;
    @GetMapping("/choices")
    public List query(){
        List<Choices> list = choicesMapper.selectList(null);
        return list;
    }
    @GetMapping("/choice/findstudent")
    public List findstudent(){
        List<Choices> list = choicesMapper.findstudent();
        return list;
    }
}
