package com.kh.semi.controller;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.ResumeBoard;
import com.kh.semi.domain.vo.User;
import com.kh.semi.service.BoardService;
import com.kh.semi.service.UserService;
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

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;

    @GetMapping("myClass.bo")
    public String myClassBoardListController() {return "board/myClassBoardListView";}

    @GetMapping("detail.bo")
    public String detailForm() {return "board/myClassBoardDetailView";}


    @GetMapping("notice.bo")
    public String selectNoticeBoardList(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int boardCount = boardService.selectBoardCount();

        PageInfo pi = new PageInfo(boardCount, cpage, 3, 10);
        List<Board> list = boardService.selectNoticeBoardList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "board/noticeBoardListView";
    }

    @GetMapping("enrollForm.no")
    public String enrollForm() {return "board/boardEnrollForm";}

    @PostMapping("insert.no")
    public String insertBoard(@ModelAttribute Board board, MultipartFile upfile, HttpSession session, Model model) {
        System.out.println(board);
        System.out.println(upfile);

        int result = boardService.insertNoticeBoard(board);

        if(result > 0){
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/notice.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/error";
        }
    }

<<<<<<< HEAD
    @GetMapping("resume.bo")
    public String selectResumeBoardList(@RequestParam(defaultValue = "1") int cpage, Model model, HttpSession session) {
        int boardCount = boardService.selectResumeBoardCount();

        User user = (User)session.getAttribute("loginUser");
        String userId = user.getUserId();
        PageInfo pi = new PageInfo(boardCount, cpage, 5, 10);
        List<ResumeBoard> list = boardService.selectResumeBoardList(pi,userId);

        return "board/resumeBoardListView";
    }

    @GetMapping("resumeForm.bo")
    public String resumeForm() {return "board/resumeFormView";}

    @PostMapping("saveResume.bo")
    public String saveResume(@ModelAttribute ResumeBoard resumeBoard, MultipartFile upfile, HttpSession session , Model model) {
        System.out.println(resumeBoard);
        System.out.println(upfile);

        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/uploadfile/");

            resumeBoard.setChangeName("/uploadfile/" + changeName);
            resumeBoard.setOriginName(changeName);
        }

        int result = boardService.insertResumeBoard(resumeBoard);

        if(result > 0){
            session.setAttribute("alretMsg","게시글 작성 완료");
            return "redirect:/resumeForm.bo";
        } else {
            session.setAttribute("errorMsg", "게시글 작성 실패");
            return "redirect:/resumeForm.bo";
        }
=======
    @GetMapping("detail.no")
    public String selectBoardDetail(int bno, Model model) {
        int result = boardService.increaseNoticeCount(bno);

        if(result > 0){
            Board b = boardService.selectNoticeBoard(bno);
            model.addAttribute("b", b);

            return "board/noticeDetailView";
        } else {
            model.addAttribute("errorMsg", "게시글 조회 실패");
            return "common/errorPage";
        }

>>>>>>> 999559134a34eb113b0532959b695988e4cff787
    }

}

