package com.example.mpdemo.controller;

import com.example.mpdemo.entity.Table;
import com.example.mpdemo.mapper.TableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TableController {
    @Autowired
    private TableMapper tableMapper;
    @GetMapping("/tablelist")
    List<Table> query(){
        return tableMapper.selecttablelist();
    }
}
