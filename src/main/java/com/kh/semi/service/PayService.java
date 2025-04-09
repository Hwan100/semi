package com.kh.semi.service;

import com.kh.semi.domain.vo.Pay;

import java.util.ArrayList;


public interface PayService {
    //학생 장려금리스트 조회
    ArrayList<Pay> selectPayList(int userNo);
}
