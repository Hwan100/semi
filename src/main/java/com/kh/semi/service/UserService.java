package com.kh.semi.service;

import com.kh.semi.domain.vo.User;

public interface UserService {
    //아이디 중복체크
    int idCheck(String userId);
}
