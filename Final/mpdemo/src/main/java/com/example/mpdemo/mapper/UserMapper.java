package com.example.mpdemo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mpdemo.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@Mapper
// 没有继承
//public interface UserMapper {
//    // 实现接口即可，方法由mybatis完成
//    @Select("select * from worker")
//    public List<User> find();
//
//    @Insert("insert into worker values (#{number},#{name},#{sex},#{sage},#{Department})")
//    // 插入失败返回0
//    public int insert(User user);
//}

public interface UserMapper extends BaseMapper<User> {

}
