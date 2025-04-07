package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface BoardMapper {
    int selectBoardCount();
    List<Board> selectNoticeBoardList(RowBounds rowBounds);
    int insertBoard(Board board);
}
