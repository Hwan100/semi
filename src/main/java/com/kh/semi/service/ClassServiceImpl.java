package com.kh.semi.service;

import com.kh.semi.domain.vo.ClassTime;
import com.kh.semi.domain.vo.Class;
import com.kh.semi.domain.vo.Schedule;
import com.kh.semi.domain.vo.User;
import com.kh.semi.mappers.ClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {

    private final ClassMapper classMapper;

    @Autowired
    public ClassServiceImpl(ClassMapper classMapper) {
        this.classMapper = classMapper;
    }

    @Override
    public int selectKey() {
        return classMapper.selectKey();
    }

    @Override
    public int createClass(Class c) {
        return classMapper.insertClass(c);
    }

    @Override
    public int updateClass(Class c) {
        return classMapper.updateClass(c);
    }

    @Override
    public int deleteClass(int classNo) {
        return classMapper.deleteClass(classNo);
    }

    @Override
    public int insertClassTime(ClassTime classTime) {
        return classMapper.insertClassTime(classTime);
    }

    @Override
    public int updateClassTime(ClassTime classTime) {
        return classMapper.updateClassTime(classTime);
    }

    @Override
    public int deleteClassTime(int classTimeNo) {
        return classMapper.deleteClassTime(classTimeNo);
    }

    @Override
    public int insertSchedule(Schedule schedule) {
        return classMapper.insertSchedule(schedule);
    }

    @Override
    public int updateSchedule(Schedule schedule) {
        return classMapper.updateSchedule(schedule);
    }

    @Override
    public int deleteSchedule(int scheduleNo) {
        return classMapper.deleteSchedule(scheduleNo);
    }

    @Override
    public ClassTime selectClassTime(ClassTime classTime) {
        return classMapper.selectClassTime(classTime);
    }

    // 강의 전체 목록 조회
    @Override
    public List<Class> selectClassList(User u) {
        return classMapper.selectClassList(u);
    }

    @Override
    public List<Class> selectClassListWithJoin() {
        return classMapper.selectClassListWithJoin();
    }

}
