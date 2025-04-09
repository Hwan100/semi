package com.kh.semi.service;

import com.kh.semi.domain.vo.*;

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

    List<ResumeBoard> selectResumeBoardList(PageInfo pi, int userNo);

    int insertResumeBoard(ResumeBoard board);

    int deleteBoard(int bno);

    List<ResumeBoard> selectCurrentResumeBoardList(int userNo);

    ResumeBoard selectResumeBoard(int bno);

    List<Board> selectMyClassBoardList(PageInfo pi);

    int insertMyClassBoard(Board board);

    Board selectMyClassBoard(int bno);

    int  updateMyClassBoard(Board board);

    int insertReply(Reply reply);

    ArrayList<Reply> selectMyClassReplyList(int bno);

    ArrayList<Board> getBoardTopN(String order, int limit);

    int updateResumeBoard(ResumeBoard board);

    int deleteResumeBoard(int b);

    int selectFeedbackCount(int bno);

    List<Feedback> selectFeedbackList(PageInfo pi, int bno);

    Feedback selectFeedback(int bno);

}
