package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BoardMapper {
    int selectBoardCount();
    List<Board> selectBoardList();
    Board selectBoard(int boardNo);
    int insertBoard(Board board);
    int updateBoard(Board board);
    int deleteBoard(int boardNo);
    int increaseCount(int boardNo);
}
