package com.kh.semi.service;

import com.kh.semi.domain.vo.Leave;
import com.kh.semi.mappers.LeaveMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveServiceImpl implements LeaveService {

    private final LeaveMapper leaveMapper;

    public LeaveServiceImpl(LeaveMapper leaveMapper) {
        this.leaveMapper = leaveMapper;
    }

    @Override
    public List<Leave> selectRecentLeaveList(int userNo, int limit) {
        return leaveMapper.selectRecentLeaveList(userNo, limit);
    }

    @Override
    public int insertLeave(Leave leave) {
        return leaveMapper.insertLeave(leave);
    }

    @Override
    public int findClassNoByNames(String className, String roomName) {
        return leaveMapper.findClassNoByNames(className, roomName);
    }
}
