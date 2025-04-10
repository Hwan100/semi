package com.kh.semi.service;

import com.kh.semi.domain.vo.User;

import java.util.ArrayList;

public interface UserService {
    //로그인
    User loginUser(String userId);

    int updateUser(User u);

    User selectUserByNo(int userNo);

    String getClassNameByClassNo(int classNo);

    int idCheck(String checkId);

    int insertUser(User u);

    ArrayList<User> allTeacherList();

    int selectUserNoById(String userId);

    ArrayList<User> allUserList();
}
