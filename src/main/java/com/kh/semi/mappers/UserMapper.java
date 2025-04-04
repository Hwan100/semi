package com.kh.semi.mappers;

import com.kh.semi.domain.vo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    User loginUser(String userId);
}
