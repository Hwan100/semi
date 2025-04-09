package com.kh.semi.controller;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.ClassTime;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.AttendanceService;
import com.kh.semi.service.ClassService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Controller
public class AttendanceController {
    private final AttendanceService attendanceService;
    private final ClassService classService;

    @Autowired
    public AttendanceController(AttendanceService attendanceService, ClassService classService) {
        this.attendanceService = attendanceService;
        this.classService = classService;
    }

//    입실
    @GetMapping("checkIn.st")
    public String enterAttendance(HttpSession session) {
//        오늘 강의가 있는지 먼저 체크.

//        오늘 날짜 집어넣어서 insert
        LocalDate today = LocalDate.now();
        LocalTime now = LocalTime.now();
        String formattedToday = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String timeStr = now.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        User loginUser = (User) session.getAttribute("loginUser");
        System.out.println(formattedToday);
        System.out.println(timeStr);
        Attendance selectItem = attendanceService.selectAttendance(loginUser.getUserNo(), formattedToday);
        System.out.println(selectItem);
        if(selectItem == null) {
            selectItem = new Attendance(0, formattedToday, timeStr, null, "결석", loginUser.getUserNo());
            attendanceService.insertAttendance(selectItem);
            System.out.println(selectItem);
        }

        session.setAttribute("attendance", selectItem);
        return "redirect:/";
    }

//    퇴실
    @GetMapping("checkOut.st")
    public String checkOutAttendance(HttpSession session) {
        LocalDate today = LocalDate.now();
        String formattedToday = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        LocalTime now = LocalTime.now();
        String timeStr = now.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        Attendance att = (Attendance)session.getAttribute("attendance");
        att.setCheckOutTime(timeStr);

        User loginUser = (User) session.getAttribute("loginUser");

//      강의 시간 조회해서 지각, 출석, 결석 판단.
        System.out.println(loginUser.getClassNo());
        System.out.println(formattedToday);
        ClassTime classTime = new ClassTime();
        classTime.setClassNo(loginUser.getClassNo());
        classTime.setClassDate(formattedToday);

        classTime = classService.selectClassTime(classTime);
        System.out.println(classTime);
        String status = "";
        // 📌 강의 시간
        LocalTime classStart = LocalTime.parse(classTime.getClassStartTime(), DateTimeFormatter.ofPattern("HH:mm"));
        LocalTime classEnd = LocalTime.parse(classTime.getClassEndTime(), DateTimeFormatter.ofPattern("HH:mm"));

        // 📌 나의 출결 시간 (예: DB or 입력값으로 받은 문자열)
        LocalTime checkIn = LocalTime.parse(att.getCheckInTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));
        LocalTime checkOut = LocalTime.parse(att.getCheckOutTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));

        if (checkIn.isAfter(classStart)) {
            status = "지각";
        } else if(checkOut.isBefore(classEnd)) {
            status = "조퇴";
        } else {
            status = "출석";
        }

        if (checkIn == null || checkOut == null) {
            status = "결석";
        }

        att.setStatus(status);
        int result = attendanceService.checkOutAttendance(att);
        System.out.println(result);
        return "redirect:/";
    }
//    조퇴 및 외출

//    휴가

//
}
