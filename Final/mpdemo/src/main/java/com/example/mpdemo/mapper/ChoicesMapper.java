package com.example.mpdemo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mpdemo.entity.Choices;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ChoicesMapper extends BaseMapper<Choices> {
    @Select("select * from choices limit 0,50")
    @Results(
            {
                    @Result(column = "no",property = "no"),
                    @Result(column = "sid",property = "sid"),
                    @Result(column = "tid",property = "tid"),
                    @Result(column = "cid",property = "cid"),
                    @Result(column = "score",property = "score"),
                    // 调用students里的方法
                    @Result(column = "sid",property = "students",javaType = List.class,
                    one = @One(select = "com.example.mpdemo.mapper.StudentMapper.selectBySid"))
            }
    )
    List<Choices> findstudent();
}
