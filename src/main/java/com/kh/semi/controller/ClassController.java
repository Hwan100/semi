package com.kh.semi.controller;

import com.kh.semi.domain.vo.Schedule;
import com.kh.semi.service.ClassService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.kh.semi.domain.vo.Class;
import com.kh.semi.domain.vo.ClassTime;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.List;

@Controller
public class ClassController {
    private final ClassService classService;

    @Autowired
    public ClassController(ClassService classService) {
        this.classService = classService;
    }

    @PostMapping("insert.fo")
    public String insert(
            @ModelAttribute Class c, // 강의 클래스
            HttpSession session,
            // 강의 요일 정보들
            @RequestParam("classDate[]") List<String> dates,
            @RequestParam("classStartTime[]") List<String> starts,
            @RequestParam("classEndTime[]") List<String> ends,
            // 강의 일정 정보
            @RequestParam("scheduleTitle[]") List<String> scheduleTitles,
            @RequestParam("scheduleDescription[]") List<String> scheduleDescription,
            @RequestParam("scheduleStartTime[]") List<String> scheduleStarts,
            @RequestParam("scheduleEndTime[]") List<String> scheduleEnds
    ) {
        System.out.println(c);
        System.out.println(dates);
        System.out.println(scheduleTitles);
//        강의 개설
        int result = classService.createClass(c);
        System.out.println(result);
        System.out.println(c);
//        강의 개설 후 받아온 강의 번호로 강의 요일 저장
        for(int i = 0; i < dates.size(); i++) {
            ClassTime classTime = new ClassTime(dates.get(i), c.getClassNo(), starts.get(i), ends.get(i));
            int daysResult = classService.insertClassTime(classTime);
        }
//        강의 일정 등록
        for(int i = 0; i < scheduleTitles.size(); i++) {
            Date startDate = java.sql.Date.valueOf(scheduleStarts.get(i));
            Date endDate = java.sql.Date.valueOf(scheduleEnds.get(i));
            Schedule schedule = new Schedule(0, scheduleTitles.get(i), startDate, endDate, scheduleDescription.get(i), c.getClassNo());
            int scheduleResult = classService.insertSchedule(schedule);
        }

        return "teacher/courseList";
    }
}
