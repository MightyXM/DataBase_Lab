package com.example.mpdemo.controller;

import com.example.mpdemo.entity.User;
import com.example.mpdemo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {
    // 自动注入，不加这个注解会导致userMapper是空
    @Autowired
    private UserMapper userMapper;
    @GetMapping("/user")
    // 返回一个String
//    public String query(){
//        List<User> list = userMapper.find();
//        System.out.println(list.toString());
//        return "查询用户";
//    }
    // 如果传json，直接将返回值改为list,效果如下
    // [{"number":"00001","name":"李勇","sex":"M","sage":14,"department":"科技部"},{"number":"00002","name":"xm","sex":"M","sage":29,"department":"科技部"}]
    public List query(){
        List<User> list = userMapper.selectList(null);
        System.out.println(list.toString());
        return list;
    }

    @PostMapping("/user")
    public String save(User user){
        int i = userMapper.insert(user);
        if(i>0){
            return "插入成功";
        }else {
            return "插入失败";
        }
    }
}
