package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Attendance;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceMapper {
    int insertAttendance(Attendance attendance);
    Attendance selectAttendance(int userNo, String classDate);
    int checkOutAttendance(Attendance attendance);
}
