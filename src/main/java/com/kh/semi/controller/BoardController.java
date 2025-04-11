package com.kh.semi.controller;

import com.kh.semi.domain.vo.*;
import com.kh.semi.service.BoardService;
import com.kh.semi.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;



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
    public String enrollNoticeForm() {return "board/noticeEnrollForm";}

    @PostMapping("insert.no")
    public String insertBoard(@ModelAttribute Board board, MultipartFile upfile, HttpSession session, Model model) {
        System.out.println(board);
        System.out.println(upfile);

        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");

            board.setChangeName("/resources/uploadfile/" + changeName);
            board.setOriginName(changeName);
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

    @GetMapping("resume.bo")
    public String selectResumeBoardList(@RequestParam(defaultValue = "1") int cpage, Model model, HttpSession session) {
        int boardCount = boardService.selectResumeBoardCount();

        User user = (User)session.getAttribute("loginUser");
        int userNo = user.getUserNo();
        PageInfo pi = new PageInfo(boardCount, cpage, 5, 10);
        List<ResumeBoard> list = boardService.selectResumeBoardList(pi,userNo);
        List<ResumeBoard> clist = boardService.selectCurrentResumeBoardList(userNo);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("clist", clist);

        return "board/resumeListView";
    }

    @GetMapping("resumeForm.bo")
    public String resumeForm() {return "board/resumeFormView";}

    @PostMapping("saveResume.bo")
    public String saveResume(@ModelAttribute ResumeBoard resumeBoard, MultipartFile upfile, HttpSession session , Model model) {

        User user = (User)session.getAttribute("loginUser");
        int userNo = user.getUserNo();

        resumeBoard.setUserNo(userNo);

        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");

            resumeBoard.setChangeName("/resources/uploadfile/" + changeName);
            resumeBoard.setOriginName(upfile.getOriginalFilename());
        }

        System.out.println(resumeBoard);
        System.out.println(upfile);

        int result = boardService.insertResumeBoard(resumeBoard);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 저장 완료");
            return "redirect:/resume.bo";
        } else {
            session.setAttribute("errorMsg", "게시글 저장 실패");
            return "redirect:/resumeForm.bo";
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
        return "noticeUpdateForm";
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

    @GetMapping("delete.no")
    public String deleteBoard(@RequestParam(value = "bno", required = false) Integer bno, HttpSession session, Model model) {
        if (bno == null) {
            model.addAttribute("errorMsg", "잘못된 게시글 번호입니다.");
            return "common/error";
        }
        int result = boardService.deleteBoard(bno);
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 삭제 성공");
            return "redirect:/notice.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/error";
        }
    }

    @GetMapping("resumeDetail.bo")
    public String resumeDetail(@RequestParam(defaultValue = "1") int cpage,@RequestParam("bno") int bno,Model model) {


        ResumeBoard r = boardService.selectResumeBoard(bno);

        int boardCount = boardService.selectFeedbackCount(bno);


        PageInfo pi = new PageInfo(boardCount,cpage, 5, 5);

        List<Feedback> list = boardService.selectFeedbackList(pi,bno);


        model.addAttribute("r", r);
        model.addAttribute("pi", pi);
        model.addAttribute("list", list);

        return "board/resumeDetailView";
    }

    @GetMapping("myClass.bo")
    public String myClassBoardListController(@RequestParam(defaultValue = "1") Integer cpage, Model model,HttpSession session) {
        int boardCount = boardService.selectBoardCount();

        User loginUser = (User)session.getAttribute("loginUser");

        int classNo = loginUser.getClassNo();


        PageInfo pi = new PageInfo(boardCount, cpage, 3, 10);
        List<Board> list = boardService.selectMyClassBoardList(pi, classNo);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "board/myClassBoardListView";
    }

    @GetMapping("enrollForm.cl")
    public String enrollMyClassBoardForm() {return "board/myClassBoardEnrollForm";}

    @PostMapping("insert.cl")
    public String insertMyClassBoard(@ModelAttribute Board board, MultipartFile upfile, HttpSession session, Model model) {
        System.out.println(board);
        System.out.println(upfile);

        // 업로드 파일이 있을 경우 처리
        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");
            board.setChangeName("/resources/uploadfile/" + changeName);
            board.setOriginName(upfile.getOriginalFilename());
        }

        int result = boardService.insertMyClassBoard(board);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/myClass.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/error";
        }
    }

    @GetMapping("detail.cl")
    public String selectMyClassBoardDetail(int bno, Model model) {
        int result = boardService.increaseNoticeCount(bno);

        if(result > 0){
            Board b = boardService.selectMyClassBoard(bno);
            model.addAttribute("b", b);

            return "board/myClassBoardDetailView";
        } else {
            model.addAttribute("errorMsg", "게시글 조회 실패");
            return "common/error";
        }
    }

    @GetMapping("updateForm.cl")
    public String updateMyClassBoard(@RequestParam(value = "bno") int boardNo, Model model) {

        model.addAttribute("b", boardService.selectNoticeBoard(boardNo));
        return "board/myClassBoardUpdateForm";
    }

    @PostMapping("update.cl")
    public String updateMyClassBoard(@ModelAttribute Board b, MultipartFile reupfile, HttpSession session, Model model) {
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

        int result = boardService.updateMyClassBoard(b);
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 수정 성공");
            return "redirect:/detail.cl?bno=" + b.getBoardNo();
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/error";
        }
    }

    @GetMapping("delete.cl")
    public String deleteMyClassBoard(@RequestParam(value = "bno", required = false) Integer bno, HttpSession session, Model model) {
        int result = boardService.deleteBoard(bno);
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 삭제 성공");
            return "redirect:/myClass.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/error";
        }
    }
    @GetMapping("resumeModify.bo")
    public String resumeModify(int bno, Model model) {
        ResumeBoard r = boardService.selectResumeBoard(bno);

        model.addAttribute("r", r);

        return "board/resumeModifyView";
    }

    @PostMapping("updateResume.bo")
    public String updateResume(@ModelAttribute ResumeBoard resumeBoard, MultipartFile upfile, HttpSession session , Model model, RedirectAttributes redirectAttributes) {


        if(!upfile.getOriginalFilename().equals("")){
            // 기존첨파일 삭제
            if(resumeBoard.getChangeName() != null && !resumeBoard.getChangeName().equals("")){
                new File(session.getServletContext().getRealPath(resumeBoard.getChangeName())).delete();
            } else {
                // 새 파일 없으면 기존 값 유지하도록 세팅
                ResumeBoard origin = boardService.selectResumeBoard(resumeBoard.getResumeNo());
                resumeBoard.setChangeName(origin.getChangeName());
                resumeBoard.setOriginName(origin.getOriginName());
            }

            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");
            resumeBoard.setChangeName("/resources/uploadfile/" + changeName);
            resumeBoard.setOriginName(upfile.getOriginalFilename());
        }




        int result = boardService.updateResumeBoard(resumeBoard);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg", "수정이 완료되었습니다!");
            return "redirect:/resume.bo";
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "게시글 수정 실패");
            return "redirect:/resumeForm.bo";
        }
    }

    @GetMapping("resumeDelete.bo")
    public String resumeDelete(@RequestParam("resumeNo") int b,
                               RedirectAttributes redirectAttributes) {

        int result = boardService.deleteResumeBoard(b);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg", "게시글 삭제 성공!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "게시글 삭제 실패...");
        }

        return "redirect:/resume.bo";
    }

    @GetMapping("feedback.bo")
    public String feedback(@RequestParam("feedbackNo") int bno, String type, Model model, HttpSession session) {
        User u = (User)session.getAttribute("loginUser");

        model.addAttribute("b", boardService.selectFeedback(bno));
        model.addAttribute("type", type);
        model.addAttribute("u", u);

        return "board/resumefeedbackDetailView";
    }



    @GetMapping("adminSiteSetting.fo")
    public String adminSiteSetting(Model model, HttpSession session) {
        Setting setting = boardService.selectSiteSetting();
        System.out.println(setting);

        model.addAttribute("s", setting);

        return "admin/adminSiteSetting";
    }


    @GetMapping("/studentMain")
    public String studentMain(Model model, HttpSession session) {
        // 공지사항
        int noticeCount = boardService.selectBoardCount();
        PageInfo piNotice = new PageInfo(noticeCount, 1, 3, 5);
        List<Board> noticeList = boardService.selectNoticeBoardList(piNotice);

        User loginUser = (User)session.getAttribute("loginUser");

        int classNo = loginUser.getClassNo();

        // 우리반 게시판
        int classBoardCount = boardService.selectBoardCount();
        PageInfo piClass = new PageInfo(classBoardCount, 1, 3, 5);
        List<Board> classBoardList = boardService.selectMyClassBoardList(piClass, classNo);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("classBoardList", classBoardList);
        model.addAttribute("pi", piNotice);

        return "student/main";
    }


    @PostMapping("updateSetting.bo")
    public String updateSetting(@ModelAttribute Setting setting, MultipartFile upfile, HttpSession session) {
        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");

            setting.setChangeName("/resources/uploadfile/" + changeName);
            setting.setOriginName(upfile.getOriginalFilename());
        }

        System.out.println(setting);
        System.out.println(upfile);

        int result = boardService.insertSetting(setting);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 저장 완료");
            return "redirect:/";
        } else {
            session.setAttribute("errorMsg", "게시글 저장 실패");
            return "redirect:/";
        }
    }
}

