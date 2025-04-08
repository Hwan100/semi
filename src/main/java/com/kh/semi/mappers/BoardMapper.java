package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
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
    List<ResumeBoard> selectResumeBoardList(RowBounds rowBounds, @Param("userId") String userId);


    int insertNoticeBoard(Board board);

    int increaseNoticeCount(int bno);

    Board selectNoticeBoard(int bno);

    int updateNoticeBoard(Board board);

    int insertResumeBoard(ResumeBoard board);
}
