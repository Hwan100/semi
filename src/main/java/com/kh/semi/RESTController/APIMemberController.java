package com.kh.semi.RESTController;
//
//import com.kh.semi.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//// @RestController = @Controller + @ResponseBody
//// 모든 요청에 대한 응답을 뷰가아닌 데이터로 직접 http객체에 하겠다.

import com.kh.semi.domain.vo.User;
import com.kh.semi.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class APIMemberController {
//
    private final UserService UserService;
//
    @Autowired
    public APIMemberController(UserService userService) {
        this.UserService = userService;
    }
//
    @GetMapping("/id")
    public String checkUserId(String checkId){
        int result = UserService.idCheck(checkId);

        if(result > 0){
            return "N";
        } else {
            return "Y";
        }
    }

    @GetMapping("/allTeacherList")
    public ArrayList<User> allTeacherList(){
        return UserService.allTeacherList();
    }

    @PostMapping("/myPage")
    public ModelAndView handleRedirect(ModelAndView mv, int userNo) {
        mv.addObject("userNo", userNo);
        mv.setViewName("myPage/adminMyPage");
        return mv;
    }

}
