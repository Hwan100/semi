package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Leave;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LeaveMapper {

    List<Leave> selectRecentLeaveList(int userNo, @Param("limit") int limit);

    int insertLeave(Leave leave);

    int findClassNoByNames(String className, String roomName);
}
