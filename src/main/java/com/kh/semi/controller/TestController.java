package com.kh.semi.controller;

import com.kh.semi.domain.vo.User;
import com.kh.semi.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

    @GetMapping("attendance.st")
    public String attendanceManage() {return "student/studentAttendancePageView";}



    @GetMapping("finish.bo")
    public String finish() {return "student/finishPage";}


    @GetMapping("adminPay.li")
    public String adminPay() {return "student/studentPay";}

    @GetMapping("adminSiteSetting.fo")
    public String adminSiteSetting() {return "admin/adminSiteSetting";}

    @GetMapping("attendance.li")
    public String attendanceList() {return "teacher/teacherAttendancePage";}

    @GetMapping("enrollForm.me")
    public String enrollForm() {return "login/memberEnrollPage";}

    @GetMapping("createCourse.fo")
    public String createClass() {return "admin/adminCreateClass";}


}
