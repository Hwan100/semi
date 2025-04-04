package com.kh.semi.mappers;
import com.kh.semi.domain.vo.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {
    // 게시글 목록 조회
    List<Board> selectBoardList(@Param("type") int type);

    // 게시글 상세 조회
    Board selectBoard(@Param("boardNo") int boardNo);

    // 게시글 등록
    int insertBoard(Board board);

    // 게시글 수정
    int updateBoard(Board board);

    // 게시글 삭제 (status N으로 변경)
    int deleteBoard(@Param("boardNo") int boardNo);

    // 게시글 조회수 증가
    int increaseCount(@Param("boardNo") int boardNo);
}
