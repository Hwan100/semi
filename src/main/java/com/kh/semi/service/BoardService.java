package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;

import java.util.List;

public interface BoardService {

    // 게시글 목록 조회
    List<Board> selectBoardList(int type);

    // 게시글 상세 조회
    Board selectBoard(int boardNo);

    // 게시글 등록
    int insertBoard(Board board);

    // 게시글 수정
    int updateBoard(Board board);

    // 게시글 삭제
    int deleteBoard(int boardNo);

    // 조회수 증가
    int increaseCount(int boardNo);
}
