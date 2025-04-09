package com.kh.semi.service;

import com.kh.semi.domain.vo.Leave;

import java.util.List;

public interface LeaveService {

    List<Leave> selectRecentLeaveList(int userNo,int limit);

    int insertLeave(Leave leave);

    int findClassNoByNames(String className, String roomName);

}
