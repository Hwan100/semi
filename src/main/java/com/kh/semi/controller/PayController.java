package com.kh.semi.controller;

import com.kh.semi.domain.vo.Pay;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.PayService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class PayController {

    private final PayService payService;

    //학생 장려금리스트 조회
    @GetMapping ("studentPay.li")
    public ModelAndView getPay(User user, ModelAndView mv, HttpSession session) {

        User loginUser = (User)session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 정보가 없는 경우 처리
            return new ModelAndView("redirect:/login");
        }

        int userNo = loginUser.getUserNo();

        ArrayList<Pay> list = payService.selectPayList(userNo);

        mv.setViewName("student/studentPay");
        mv.addObject("payList", list);

        return mv;
    }
}
