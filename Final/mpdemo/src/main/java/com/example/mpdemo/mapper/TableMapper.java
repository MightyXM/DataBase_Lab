package com.example.mpdemo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.mpdemo.entity.Table;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TableMapper extends BaseMapper<Table> {
    @Select("select tid,used,reserved from `table`")
    List<Table> selecttablelist();
}
