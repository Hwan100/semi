package com.kh.semi.controller;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.AttendanceService;
import com.kh.semi.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
public class UserController {

    private final UserService userService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final AttendanceService attendanceService;

    @Autowired
    public UserController(UserService userService , BCryptPasswordEncoder bCryptPasswordEncoder, AttendanceService attendanceService) {
        this.userService = userService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.attendanceService = attendanceService;
    }

    @PostMapping("login.us")
    public ModelAndView login(User user, ModelAndView mv, HttpSession session) {

        User loginUser = userService.loginUser(user.getUserId());

        if (loginUser == null) {
            mv.addObject("errorMsg", "아이디를 찾을 수 없습니다.");
            mv.setViewName("login/loginPage");
        } else {
            // 암호화된 비밀번호 비교
            if (!bCryptPasswordEncoder.matches(user.getUserPwd(), loginUser.getUserPwd())) {
                mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
                mv.setViewName("login/loginPage");
            } else {
                LocalDate today = LocalDate.now();
                String formattedToday = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                Attendance attendance = attendanceService.selectAttendance(loginUser.getUserNo(), formattedToday);
                session.setAttribute("attendance", attendance);
                session.setAttribute("loginUser", loginUser);
                mv.setViewName("redirect:/");
            }
        }
        return mv;
    }


    @GetMapping("logout.us")
    public String logout(HttpSession session) {
        session.setAttribute("alertMsg", "로그아웃 완료");
        session.removeAttribute("loginUser");

        return "redirect:/";
    }

    @GetMapping("myPage.me")
    public ModelAndView myPage(ModelAndView mv, HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            mv.setViewName("login/loginPage");
        } else {
            User loginUser = (User) session.getAttribute("loginUser");
            String className = userService.getClassNameByClassNo(loginUser.getClassNo());
            mv.addObject("loginUser", loginUser);
            mv.addObject("className", className);

            switch (loginUser.getUserRole()) {
                case 1 -> mv.setViewName("myPage/studentMyPageView");
                case 2 -> mv.setViewName("myPage/teacherMyPage");
                case 3 -> mv.setViewName("myPage/adminMyPage");
                default -> mv.setViewName("common/error"); // 예외 처리
            }
        }

        return mv;
    }
    @PostMapping("StudentUpdate.me")
    public ModelAndView updateStudent(User u, ModelAndView mv, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            mv.setViewName("redirect:/");
            return mv;
        }
        u.setUserNo(loginUser.getUserNo());
        session.setAttribute("user", u);
        int result = userService.updateUser(u);

        if (result > 0) {
            User updatedUser = userService.selectUserByNo(u.getUserNo());
            session.setAttribute("loginUser", updatedUser);

            mv.setViewName("redirect:/myPage.me");
        } else {
            mv.addObject("errorMsg", "회원 정보 수정에 실패했습니다.");
            mv.setViewName("common/error");
        }
        return mv;
    }

    @PostMapping("teacherUpdate.me")
    public ModelAndView updateTeacher(User u, ModelAndView mv, HttpSession session) {
        User loginTeacher = (User) session.getAttribute("loginUser");
        if (loginTeacher == null) {
            mv.setViewName("redirect:/");
            return mv;
        }
        u.setUserNo(loginTeacher.getUserNo());
        session.setAttribute("user", u);
        int result = userService.updateUser(u);

        if (result > 0) {
            User updatedUser = userService.selectUserByNo(u.getUserNo());
            session.setAttribute("loginUser", updatedUser);

            mv.setViewName("redirect:/myPage.me");
        } else {
            mv.addObject("errorMsg", "회원 정보 수정에 실패했습니다.");
            mv.setViewName("common/error");
        }
        return mv;
    }

    @PostMapping("adminUpdate.me")
    public ModelAndView aminTeacher(User u, ModelAndView mv, HttpSession session) {
        User loginAdmin = (User) session.getAttribute("loginUser");
        if (loginAdmin == null) {
            mv.setViewName("redirect:/");
            return mv;
        }
        u.setUserNo(loginAdmin.getUserNo());
        session.setAttribute("user", u);
        int result = userService.updateUser(u);

        if (result > 0) {
            User updatedUser = userService.selectUserByNo(u.getUserNo());
            session.setAttribute("loginUser", updatedUser);

            mv.setViewName("redirect:/myPage.me");
        } else {
            mv.addObject("errorMsg", "회원 정보 수정에 실패했습니다.");
            mv.setViewName("common/error");
        }
        return mv;
    }

    @PostMapping("insert.us")
    public ModelAndView insert(User u, ModelAndView mv, HttpSession session) {
        String pwd = bCryptPasswordEncoder.encode(u.getUserPwd());
        u.setUserPwd(pwd);

        int result = userService.insertUser(u);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입을 완료했습니다.");
            session.setAttribute("loginUser", u);
            mv.setViewName("redirect:/");
        } else {
            session.setAttribute("errorMsg", "회원가입을 실패하였습니다.");
            mv.setViewName("redirect:/");
        }
        System.out.println("생년월일 확인: " + u.getUserBirth());

        return mv;
    }



}

