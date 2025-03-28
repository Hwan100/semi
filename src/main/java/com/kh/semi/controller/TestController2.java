package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController2 {
    @GetMapping("resumeManage.bo")
    public String resumeManage() {return "board/resumeManageView";}
}
