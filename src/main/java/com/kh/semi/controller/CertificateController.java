package com.kh.semi.controller;

import com.kh.semi.domain.vo.Certificate;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.CertificateService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class CertificateController {

    private final CertificateService certificateService;

    @GetMapping("finish.bo")
    public String finish(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            model.addAttribute("errorMsg", "로그인 후 이용 가능합니다.");
            return "common/error"; // 또는 로그인 페이지로 redirect
        }
        int userNo = loginUser.getUserNo();

        List<Certificate> list = certificateService.selectCertificateList(userNo);

        model.addAttribute("list", list);
        return "student/finishPage";}

}
