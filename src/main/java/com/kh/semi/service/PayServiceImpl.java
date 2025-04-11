package com.kh.semi.service;

import com.kh.semi.domain.vo.Pay;
import com.kh.semi.mappers.PayMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class PayServiceImpl implements PayService {

    private final PayMapper payMapper;

    //학생 장려금리스트 조회
    @Override
    public ArrayList<Pay> selectPayList(int userNo) {
        return payMapper.selectPayList(userNo);
    }

    @Override
    public ArrayList<Pay> selectAdminPayList() {
        return payMapper.selectAdminPayList();
    }
}
