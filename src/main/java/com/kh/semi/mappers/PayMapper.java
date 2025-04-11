package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Pay;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface PayMapper {
    //학생 PayList 조회
    ArrayList<Pay> selectPayList(int userNo);
    ArrayList<Pay> selectAdminPayList();
}
