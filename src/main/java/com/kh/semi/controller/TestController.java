package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("class.bo")
    public String enrollForm() {return "board/myclassBoardListView";}

    @GetMapping("detail.bo")
    public String detailForm() {return "board/myclassBoardDetailView";}
}
