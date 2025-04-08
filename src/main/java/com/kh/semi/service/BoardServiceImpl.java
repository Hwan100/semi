package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.mappers.BoardMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;

    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public int selectBoardCount() {
        return boardMapper.selectBoardCount();
    }

    @Override
    public List<Board> selectNoticeBoardList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return boardMapper.selectNoticeBoardList(rowBounds);
    }

    @Override
    public int insertNoticeBoard(Board board) {
        return boardMapper.insertNoticeBoard(board);
    }

    @Override
    public int increaseNoticeCount(int bno) {
        return boardMapper.increaseNoticeCount(bno);
    }


}
