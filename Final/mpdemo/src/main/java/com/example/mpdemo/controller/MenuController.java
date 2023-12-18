package com.example.mpdemo.controller;

import com.example.mpdemo.entity.Menu;
import com.example.mpdemo.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MenuController {
    @Autowired
    private MenuMapper menuMapper;
    @GetMapping("/menu")
    List<Menu> query(){
        return menuMapper.selectList(null);
    }
}
