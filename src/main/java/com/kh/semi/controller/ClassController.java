package com.kh.semi.controller;

import com.kh.semi.domain.vo.Schedule;
import com.kh.semi.service.ClassService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.kh.semi.domain.vo.Class;
import com.kh.semi.domain.vo.ClassTime;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            @RequestParam(value = "scheduleTitle[]", required = false) List<String> scheduleTitles,
            @RequestParam(value = "scheduleDescription[]", required = false) List<String> scheduleDescription,
            @RequestParam(value = "scheduleStartTime[]", required = false) List<String> scheduleStarts,
            @RequestParam(value = "scheduleEndTime[]", required = false) List<String> scheduleEnds,
            @RequestParam(value = "scheduleType[]", required = false) List<String> scheduleTypes
    ) {
//        강의 개설
        int result = classService.createClass(c);
//        예외처리 필요.

        Map<String, String[]> timeMap = new HashMap<>();

        // 🧩 요일별 시간 맵핑
        for (int i = 0; i < dates.size(); i++) {
            timeMap.put(dates.get(i), new String[]{starts.get(i), ends.get(i)});
        }
        LocalDate date = c.getStartDate().toLocalDate();
        LocalDate endDate = c.getEndDate().toLocalDate();
//        강의 개설 후 받아온 강의 번호로 강의 요일 저장

        while (!date.isAfter(endDate)) {
            // 현재 날짜의 한글 요일 얻기
            DayOfWeek dow = date.getDayOfWeek(); // MONDAY ~ SUNDAY
            String koreanDay = getKoreanDay(dow);

            if (timeMap.containsKey(koreanDay)) {
                String[] times = timeMap.get(koreanDay);
                System.out.println(date.toString() + " (" + koreanDay + ") → " + times[0] + " ~ " + times[1]);
                ClassTime classTime = new ClassTime(date.toString(), c.getClassNo(), times[0], times[1]);
                int daysResult = classService.insertClassTime(classTime);
            }

            date = date.plusDays(1);
        }

//        for(int i = 0; i < dates.size(); i++) {
//            ClassTime classTime = new ClassTime(dates.get(i), c.getClassNo(), starts.get(i), ends.get(i));
//            int daysResult = classService.insertClassTime(classTime);
//            //        예외처리 필요.
//        }
//        강의 일정 등록
        if(scheduleTitles != null && !scheduleTitles.isEmpty()) {
            for(int i = 0; i < scheduleTitles.size(); i++) {
                Date schduleStartDate = java.sql.Date.valueOf(scheduleStarts.get(i));
                Date schduleEndDate = java.sql.Date.valueOf(scheduleEnds.get(i));
                Schedule schedule = new Schedule(0, scheduleTitles.get(i), schduleStartDate, schduleEndDate, scheduleDescription.get(i), c.getClassNo(), scheduleTypes.get(i));
                int scheduleResult = classService.insertSchedule(schedule);
                //        예외처리 필요.
            }
        }
//      강의 조회 페이지로 이동. 강의 등록 성공 메세지와 함께 이동
        return "teacher/courseList";
    }

    private String getKoreanDay(DayOfWeek dayOfWeek) {
        return switch (dayOfWeek) {
            case MONDAY -> "월";
            case TUESDAY -> "화";
            case WEDNESDAY -> "수";
            case THURSDAY -> "목";
            case FRIDAY -> "금";
            case SATURDAY -> "토";
            case SUNDAY -> "일";
            default -> "";
        };
    }
}


