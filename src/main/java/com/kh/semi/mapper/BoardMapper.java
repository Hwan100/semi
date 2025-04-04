package com.kh.semi.mapper;


import java.util.List;
import com.kh.semi.domain.vo.Board;

public interface BoardMapper {
    int selectBoardCount();
    List<Board> selectBoardList();
    Board selectBoard(int boardNo);
    int insertBoard(Board board);
    int updateBoard(Board board);
    int deleteBoard(int boardNo);
    int increaseCount(int boardNo);
}