package com.kh.semi.mappers;

import com.kh.semi.domain.vo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface UserMapper {
    User loginUser(String userId);

    int updateUser(User u);

    User selectUserByNo(int userNo);

    String getClassNameByClassNo(int classNo);

    int idCheck(@Param("userId") String userId);

    int insertUser(User u);

    ArrayList<User> allTeacherList();

    int selectUserNoById(String userId);

    ArrayList<User> allUserList();

    ArrayList<User> selectStudentsByClassNo(int classNo);
}