package com.kh.semi.mappers;

import com.kh.semi.domain.vo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    User loginUser(String userId);

    int updateUser(User u);

    User selectUserByNo(int userNo);

    String getClassNameByClassNo(int classNo);
}
