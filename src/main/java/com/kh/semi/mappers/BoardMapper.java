package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Reply;
import com.kh.semi.domain.vo.ResumeBoard;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface BoardMapper {
    int selectBoardCount();

    List<Board> selectNoticeBoardList(RowBounds rowBounds);

    int insertBoard(Board board);
    int selectResumeBoardCount();
    List<ResumeBoard> selectResumeBoardList(RowBounds rowBounds, @Param("userNo") int userNo);


    int insertNoticeBoard(Board board);

    int increaseNoticeCount(int bno);

    Board selectNoticeBoard(int bno);

    int updateNoticeBoard(Board b);

    int insertResumeBoard(ResumeBoard board);

    int deleteBoard(int bno);

    List<ResumeBoard> selectCurrentResumeBoardList(int userNo);

    ResumeBoard selectResumeBoard(int bno);

    List<Board> selectMyClassBoardList(RowBounds rowBounds);

    Integer selectClassNoByRoomName(String roomName);

    int insertMyClassBoard(Board board);

    Board selectMyClassBoard(int bno);

    int  updateMyClassBoard(Board board);

    int insertReply(Reply reply);

    ArrayList<Reply> selectMyClassReplyList(int bno);

    ArrayList<Board> getBoardTopN(String order, int limit);

    int updateResumeBoard(ResumeBoard b);

    int deleteResumeBoard(int b);
}
