package com.kh.semi.service;

import com.kh.semi.domain.vo.User;

public interface UserService {
    //로그인
    User loginUser(String userId);
    //아이디 중복체크
    int idCheck(String userId);
}
