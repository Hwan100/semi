package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface BoardService {

    int selectBoardCount();

    List<Board> selectNoticeBoardList(PageInfo pi);

    int insertBoard(Board board);

}
