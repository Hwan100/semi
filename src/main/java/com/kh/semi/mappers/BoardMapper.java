package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.ResumeBoard;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface BoardMapper {
    int selectBoardCount();

    List<Board> selectNoticeBoardList(RowBounds rowBounds);
<<<<<<< HEAD
    int insertBoard(Board board);
    int selectResumeBoardCount();
    List<ResumeBoard> selectResumeBoardList(RowBounds rowBounds, @Param("userId") String userId);
=======

    int insertNoticeBoard(Board board);

    int increaseNoticeCount(int bno);

    Board selectNoticeBoard(int bno);
>>>>>>> 999559134a34eb113b0532959b695988e4cff787
}
