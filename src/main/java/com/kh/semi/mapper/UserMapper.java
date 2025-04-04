package com.kh.semi.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    int idCheck(@Param("userId") String checkId);
}
