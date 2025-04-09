package com.kh.semi.mappers;

import com.kh.semi.domain.vo.ClassTime;
import com.kh.semi.domain.vo.Schedule;
import org.apache.ibatis.annotations.Mapper;
import com.kh.semi.domain.vo.Class;

import java.util.List;

@Mapper
public interface ClassMapper {
    int selectKey();
    int insertClass(Class c);
    int updateClass(Class c);
    int deleteClass(int classNo);

//    강의 요일 생성, 수정, 삭제
    int insertClassTime(ClassTime classTime);
    int updateClassTime(ClassTime classTime);
    int deleteClassTime(int classTimeNo);

//    강의 일정 생성, 수정, 삭제
    int insertSchedule(Schedule schedule);
    int updateSchedule(Schedule schedule);
    int deleteSchedule(int scheduleNo);

//    강의 시간표
    ClassTime selectClassTime(ClassTime classTime);

    // 강의 목록 조회
    List<Class> selectClassList();

    List<Class> selectClassListWithJoin();

}
