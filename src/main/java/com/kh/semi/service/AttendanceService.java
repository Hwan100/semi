package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;

public interface AttendanceService {
//    입실
    int insertAttendance(Attendance attendance);
//    출석 조회
    Attendance selectAttendance(int userNo, String date);
//    퇴실
    int checkOutAttendance(Attendance attendance);
//
}
