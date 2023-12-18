package com.example.mpdemo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mpdemo.entity.Ordering;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderingMapper extends BaseMapper<Ordering> {
    @Select("select `no` from ordering;")
    List<Integer> selectOn();
}
