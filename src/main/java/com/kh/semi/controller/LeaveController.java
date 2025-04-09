package com.kh.semi.controller;

import com.kh.semi.domain.vo.Leave;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.LeaveService;
import com.kh.semi.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class LeaveController {
    private final LeaveService leaveService;

    @GetMapping("/studentVacation.li")
    public String showLeaveList(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            model.addAttribute("errorMsg", "로그인 후 이용 가능합니다.");
            return "common/error"; // 또는 로그인 페이지로 redirect
        }
        int userNo = loginUser.getUserNo();

        List<Leave> list = leaveService.selectRecentLeaveList(userNo, 5);
        System.out.println("불러온 휴가 개수 ▶ " + list.size());
        model.addAttribute("list", list);
        return "student/studentVacationView";
    }


    @PostMapping("/submitLeave.do")
    public String submitLeave(@RequestParam String className, @RequestParam String roomName, @RequestParam String type, @ModelAttribute Leave leave, @RequestParam(required = false) MultipartFile upfile, HttpSession session, Model model) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            model.addAttribute("errorMsg", "로그인 후 이용 가능합니다.");
            return "common/error"; // 또는 로그인 페이지로 redirect
        }
        session.setAttribute("loginUser", loginUser);
        leave.setUserNo(loginUser.getUserNo());

        // "휴가" or "병가" → 숫자로 매핑
        if ("병가".equals(type)) {
            leave.setType(2);
        } else {
            leave.setType(1); // 기본값: 휴가
        }
        if (upfile != null && !upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");
            leave.setChangeName("/resources/uploadfile/" + changeName);
            leave.setOriginName(upfile.getOriginalFilename());
        }

        int result = leaveService.insertLeave(leave);
        if (result > 0) {
            session.setAttribute("alertMsg", "휴가 신청 완료!");
            return "student/studentVacationView";
        } else {
            model.addAttribute("errorMsg", "휴가 신청 실패");
            return "common/error";
        }
    }

    @PostMapping("deleteLeave.bo")
    public String deleteLeave(@RequestParam("selectVacation") List<Integer> leaveNos, HttpSession session, Model model) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            model.addAttribute("errorMsg", "로그인 후 이용해주세요.");
            return "common/error";
        }

        int result = leaveService.deleteLeave(leaveNos);
        if(result > 0){
            session.setAttribute("alertMsg", "휴가 신청 삭제 성공");
        } else {
            session.setAttribute("alertMsg", "휴가 신청 삭제 실패");
        }
        return "redirect:/studentVacation.li";
    }



}
