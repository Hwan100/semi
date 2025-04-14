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





    @GetMapping("infoList.li")
    public String infoList() {return "teacher/teacherStudentInfoListPage";}

    @GetMapping("vacation.li")
    public String vacation() {return "teacher/teacherVacationList";}
    

    @GetMapping("attendance.li")
    public ModelAndView attendanceList(@RequestParam("classNo") int classNo, ModelAndView mv) {
        // classNo는 여기서 필요하면 mv에 담거나, 서비스 호출 시 사용할 수 있음
        mv.addObject("classNo", classNo); // 뷰에서도 ${classNo}로 사용할 수 있게 전달
        mv.setViewName("teacher/teacherAttendancePage"); // 기존 페이지 그대로 유지
        return mv;
    }

    @GetMapping("enrollForm.me")
    public String enrollForm() {return "login/memberEnrollPage";}

    @GetMapping("createCourse.fo")
    public String createClass() {return "admin/adminCreateClass";}


}
