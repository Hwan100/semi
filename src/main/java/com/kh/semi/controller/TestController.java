package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("myClass.bo")
    public String myClassBoardListController() {return "board/myclassBoardListView";}

    @GetMapping("notice.bo")
    public String noticeBoardListController() {return "board/noticeBoardListView";}

    @GetMapping("detail.bo")
    public String detailForm() {return "board/myclassBoardDetailView";}

    @GetMapping("resume.bo")
    public String resumeManage() {return "board/resumeListView";}

    @GetMapping("resumeForm.bo")
    public String resumeForm() {return "board/resumeFormView";}

    @GetMapping("resumeDetail.bo")
    public String resumeDetail() {return "board/resumeDetailView";}

    @GetMapping("myPage.st")
    public String myPage() {return "MyPage/StudentMyPageView";}

    @GetMapping("attendance.st")
    public String attendanceManage() {return "StudentPage/StudnetAttendancePageView";}

    @GetMapping("course.li")
    public String course() {return "teacher/courseList";}

    @GetMapping("completedCourse.li")
    public String completedCourse() {return "teacher/completedCourseList";}
}
