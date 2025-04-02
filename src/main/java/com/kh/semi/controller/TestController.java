package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("myClass.bo")
    public String myClassBoardListController() {return "board/myClassBoardListView";}

    @GetMapping("notice.bo")
    public String noticeBoardListController() {return "board/noticeBoardListView";}

    @GetMapping("detail.bo")
    public String detailForm() {return "board/myClassBoardDetailView";}

    @GetMapping("resume.bo")
    public String resumeManage() {return "board/resumeListView";}

    @GetMapping("resumeForm.bo")
    public String resumeForm() {return "board/resumeFormView";}

    @GetMapping("resumeDetail.bo")
    public String resumeDetail() {return "board/resumeDetailView";}

    @GetMapping("myPage.st")
    public String myPage() {return "myPage/studentMyPageView";}

    @GetMapping("attendance.st")
    public String attendanceManage() {return "studentPage/studentAttendancePageView";}

    @GetMapping("course.li")
    public String course() {return "teacher/courseList";}

    @GetMapping("completedCourse.li")
    public String completedCourse() {return "teacher/completedCourseList";}

    @GetMapping("finish.bo")
    public String finish() {return "studentPage/finishPage";}

    @GetMapping("studentVacation.li")
    public String studentVacation() {return "studentPage/studentVacationView";}

    @GetMapping("studentPay.li")
    public String studentPay() {return "studentPage/studentPay";}

    @GetMapping("adminPay.li")
    public String adminPay() {return "studentPage/studentPay";}

    @GetMapping("adminSiteSetting.fo")
    public String adminSiteSetting() {return "admin/adminSiteSetting";}
}
