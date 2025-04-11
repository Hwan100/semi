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

    @GetMapping("infoList.li")
    public String infoList() {return "teacher/teacherStudentInfoListPage";}

    @GetMapping("attendance.li")
    public ModelAndView attendance(@RequestParam("classNo") int classNo, ModelAndView mv) {
        mv.addObject("classNo", classNo);
        mv.setViewName("teacher/teacherAttendancePage");
        return mv;
    }

    @GetMapping("vacation.li")
    public ModelAndView vacation(@RequestParam("classNo") int classNo, ModelAndView mv) {
        mv.addObject("classNo", classNo); // 🔥 JSP에 전달!
        mv.setViewName("teacher/teacherVacationList");
        return mv;
    }

    @GetMapping("enrollForm.me")
    public String enrollForm() {return "login/memberEnrollPage";}

    @GetMapping("createCourse.fo")
    public String createClass() {return "admin/adminCreateClass";}


}
