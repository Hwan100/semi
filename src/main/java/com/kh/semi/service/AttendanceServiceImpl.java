package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.mappers.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttendanceServiceImpl implements AttendanceService {
    private final AttendanceMapper attendanceMapper;

    @Autowired
    AttendanceServiceImpl(AttendanceMapper attendanceMapper) {
        this.attendanceMapper = attendanceMapper;
    }

    @Override
    public int insertAttendance(Attendance attendance) {
        return attendanceMapper.insertAttendance(attendance);
    }

    @Override
    public Attendance selectAttendance(int userNo, String date) {
        return attendanceMapper.selectAttendance(userNo, date);
    }

    @Override
    public int checkOutAttendance(Attendance attendance) {
        return attendanceMapper.checkOutAttendance(attendance);
    }

//    자동 지각 처리

}
