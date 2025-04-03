//package com.kh.semi.RESTController;
//
//import com.kh.semi.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//// @RestController = @Controller + @ResponseBody
//// 모든 요청에 대한 응답을 뷰가아닌 데이터로 직접 http객체에 하겠다.
//@RestController
//@RequestMapping("/api/user")
//public class APIMemberController {
//
//    private final UserService UserService;
//
//    @Autowired
//    public APIMemberController(UserService userService) {
//        this.userService = userService;
//    }
//
//    @GetMapping("/id")
//    public String checkUserId(String checkId){
//        int result = userService.idCheck(checkId);
//
//        if(result > 0){
//            return "NNNNN";
//        } else {
//            return "NNNNY";
//        }
//    }
//}
