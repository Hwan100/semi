package com.kh.semi.controller;

import com.kh.semi.domain.vo.User;
import com.kh.semi.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("login.us")
    public ModelAndView login(User user, ModelAndView mv, HttpSession session) {

        session.setAttribute("user", user);
        User loginUser = userService.loginUser(user.getUserId());

        if (loginUser == null) {
            mv.addObject("errorMsg", "아이디를 찾을 수 없습니다.");
            mv.setViewName("login/loginPage");
        } else if(!user.getUserPwd().equals(loginUser.getUserPwd())) {
            mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
            mv.setViewName("login/loginPage");
        } else {
            session.setAttribute("loginUser", loginUser);
            mv.setViewName("redirect:/");
        }
        return mv;
    }

    @GetMapping("logout.me")
    public String logout(HttpSession session) {
        session.setAttribute("alertMsg", "로그아웃 완료");
        session.removeAttribute("loginUser");

        return "redirect:/";
    }

    @PostMapping("myPage.st")
    public ModelAndView myPage(ModelAndView mv, HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            mv.setViewName("login/loginPage");
        } else {
            switch (((User) session.getAttribute("loginUser")).getUserRole()) {
                case 1 -> mv.setViewName("myPage/studentMyPage");
                case 2 -> mv.setViewName("myPage/teacherMyPage");
                case 3 -> mv.setViewName("myPage/adminMyPage");
            }
        }
        return mv;
    }
}
