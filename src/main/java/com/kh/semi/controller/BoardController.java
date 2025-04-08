package com.kh.semi.controller;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;
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

import java.io.File;
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

        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");

            board.setChangeName("/resources/uploadfile/" + changeName);
            board.setOriginName(upfile.getOriginalFilename());
        }

        int result = boardService.insertNoticeBoard(board);

        if(result > 0){
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/notice.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/error";
        }
    }

    @GetMapping("detail.no")
    public String selectBoardDetail(int bno, Model model) {
        int result = boardService.increaseNoticeCount(bno);

        if(result > 0){
            Board b = boardService.selectNoticeBoard(bno);
            model.addAttribute("b", b);

            return "board/noticeDetailView";
        } else {
            model.addAttribute("errorMsg", "게시글 조회 실패");
            return "common/error";
        }

    }

    @GetMapping("updateForm.no")
    public String updateBoard(@RequestParam(value = "bno") int boardNo, Model model) {

        model.addAttribute("b", boardService.selectNoticeBoard(boardNo));
        return "board/boardUpdateForm";
    }

    @PostMapping("update.no")
    public String updateBoard(@ModelAttribute Board b, MultipartFile reupfile, HttpSession session, Model model) {
        //새로운 첨부파일 있다면 저장 후 b객체에 파일명 수정
        //b객체 전달받은 값으로 수정

        //새로운 첨부 파일이 있는가?
        if(!reupfile.getOriginalFilename().equals("")){
            //기존첨파일 삭제
            if(b.getChangeName() != null && !b.getChangeName().equals("")){
                new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
            }

            String changeName = Template.saveFile(reupfile, session, "/resources/uploadfile/");
            b.setChangeName("/resources/uploadfile/" + changeName);
            b.setOriginName(reupfile.getOriginalFilename());
        }

        int result = boardService.updateNoticeBoard(b);
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 수정 성공");
            return "redirect:/detail.no?bno=" + b.getBoardNo();
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/error";
        }
    }

}

