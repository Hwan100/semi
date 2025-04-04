package com.kh.semi.mappers;

import com.kh.semi.domain.vo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    User loginUser(String userId);
    int idCheck(@Param("userId") String userId);
}
