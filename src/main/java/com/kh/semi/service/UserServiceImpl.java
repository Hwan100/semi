package com.kh.semi.service;

import com.kh.semi.domain.vo.User;
import com.kh.semi.mappers.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) { this.userMapper = userMapper; }

    @Override
    public User loginUser(String userId) { return userMapper.loginUser(userId); }

    @Override
    public int updateUser(User u) {return userMapper.updateUser(u);}

    @Override
    public User selectUserByNo(int userNo) {return userMapper.selectUserByNo(userNo);}

    @Override
    public String getClassNameByClassNo(int classNo) {return userMapper.getClassNameByClassNo(classNo);}

    @Override
    public int idCheck(String userId) { return userMapper.idCheck(userId);
    }

    @Override
    public int insertUser(User u) {return userMapper.insertUser(u);}

    @Override
    public ArrayList<User> allTeacherList() { return userMapper.allTeacherList(); }

    @Override
    public int selectUserNoById(String userId) {
        return userMapper.selectUserNoById(userId);
    }

    @Override
    public ArrayList<User> allUserList() { return userMapper.allUserList(); }
}
