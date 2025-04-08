package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.ResumeBoard;

import java.util.ArrayList;
import java.util.List;

public interface BoardService {

    int selectBoardCount();

    List<Board> selectNoticeBoardList(PageInfo pi);

    int insertNoticeBoard(Board board);

    int increaseNoticeCount(int bno);

    Board selectNoticeBoard(int bno);

    int updateNoticeBoard(Board b);

    //자소서 및 이력서 게시글 카운팅
    int selectResumeBoardCount();

    List<ResumeBoard> selectResumeBoardList(PageInfo pi, String userId);

    int insertResumeBoard(ResumeBoard board);

    int deleteNoticeBoard(int bno);

    List<Board> selectMyClassBoardList(PageInfo pi);

    int insertMyClassBoard(Board board);

    Board selectMyClassBoard(int bno);

    int  updateMyClassBoard(Board board);

}
