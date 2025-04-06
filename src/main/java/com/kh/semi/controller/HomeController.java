package com.kh.semi.controller;

import com.kh.semi.domain.vo.User;
import com.kh.semi.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Case;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("/")
    public ModelAndView home(ModelAndView mv, HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            mv.setViewName("login/loginPage");
        } else {
            switch (((User) session.getAttribute("loginUser")).getUserRole()) {
                case 2 -> mv.setViewName("teacher/main");
                case 3 -> mv.setViewName("admin/main");
                default -> mv.setViewName("student/main");
            }
        }

        return mv;
    }


}
