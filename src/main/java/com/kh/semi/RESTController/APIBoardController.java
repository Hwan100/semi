package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Reply;
import com.kh.semi.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/board")
public class APIBoardController {

    private final BoardService boardService;

    @PostMapping("/reply")
    public String insertReply(@RequestBody  Reply r){
        return boardService.insertReply(r) > 0 ? "success" : "fail";
    }

    @GetMapping("/reply")
    public ArrayList<Reply> getReplyList(int boardNo) {
        return boardService.selectMyClassReplyList(boardNo);
    }

    //produces : 해당 타입으로 응답을 반환해 줘.
    @GetMapping(value = "/topn", produces = "application/json; charset=UTF-8")
    public ArrayList<Board> getBoardTopN(String order, int limit) {
        return boardService.getBoardTopN(order, limit);
    }

}
