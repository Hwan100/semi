package com.kh.semi.service;

import com.kh.semi.domain.vo.User;

public interface UserService {
    //로그인
    User loginUser(String userId);

}
