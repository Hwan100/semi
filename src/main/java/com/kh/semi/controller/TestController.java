package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @GetMapping("attendance.st")
    public String attendanceManage() {return "student/studentAttendancePageView";}



    @GetMapping("finish.bo")
    public String finish() {return "student/finishPage";}


    @GetMapping("adminPay.li")
    public String adminPay() {return "student/studentPay";}


    @GetMapping("attendance.li")
    public String attendanceList() {return "teacher/teacherAttendancePage";}

    @GetMapping("enrollForm.me")
    public String enrollForm() {return "login/memberEnrollPage";}

    @GetMapping("createCourse.fo")
    public String createClass() {return "admin/adminCreateClass";}
}
