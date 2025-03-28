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

    @GetMapping("resumeManage.bo")
    public String resumeManage() {return "board/resumeManageView";}
}
