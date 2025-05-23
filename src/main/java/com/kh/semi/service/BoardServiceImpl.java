package com.kh.semi.service;

import com.kh.semi.domain.vo.*;
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

    @Override
    public Board selectNoticeBoard(int bno) {
        return boardMapper.selectNoticeBoard(bno);
    }

    @Override
    public int updateNoticeBoard(Board b) {
        return boardMapper.updateNoticeBoard(b);
    }

    @Override
    public int selectResumeBoardCount() {return boardMapper.selectResumeBoardCount() ;}

    @Override
    public List<ResumeBoard> selectResumeBoardList(PageInfo pi, int userNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return boardMapper.selectResumeBoardList(rowBounds, userNo);
    }

    @Override
    public int insertResumeBoard(ResumeBoard board) {
        return boardMapper.insertResumeBoard(board);
    }

    @Override
    public int deleteBoard(int bno) {
        return boardMapper.deleteBoard(bno);
    }

    @Override
    public List<ResumeBoard> selectCurrentResumeBoardList(int userNo) {
        return boardMapper.selectCurrentResumeBoardList(userNo);
    }

    @Override
    public ResumeBoard selectResumeBoard(int bno) {
        return boardMapper.selectResumeBoard(bno);
    }

    @Override
    public List<Board> selectMyClassBoardList(PageInfo pi, int classNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return boardMapper.selectMyClassBoardList(rowBounds, classNo);
    }

    @Override
    public int insertMyClassBoard(Board board) {
        System.out.println("입력된 roomName: " + board.getRoomName());

        Integer classNo = boardMapper.selectClassNoByRoomName(board.getRoomName());
        System.out.println("조회된 classNo: " + classNo);

        if (classNo == null) {
            throw new IllegalArgumentException("입력한 반 이름(roomName)에 해당하는 CLASS_NO가 없습니다.");
        }
        board.setClassNo(classNo);

        return boardMapper.insertMyClassBoard(board);
    }

    @Override
    public Board selectMyClassBoard(int bno) {
        return boardMapper.selectMyClassBoard(bno);
    }

    @Override
    public int updateMyClassBoard(Board board) {
        System.out.println("입력된 roomName: " + board.getRoomName());

        Integer classNo = boardMapper.selectClassNoByRoomName(board.getRoomName());
        System.out.println("조회된 classNo: " + classNo);

        if (classNo == null) {
            throw new IllegalArgumentException("입력한 반 이름(roomName)에 해당하는 CLASS_NO가 없습니다.");
        }
        board.setClassNo(classNo);
        return boardMapper.updateMyClassBoard(board);
    }

    @Override
    public int insertReply(Reply reply) {
        return boardMapper.insertReply(reply);
    }

    @Override
    public ArrayList<Reply> selectMyClassReplyList(int bno) {
        return boardMapper.selectMyClassReplyList(bno);
    }

    @Override
    public ArrayList<Board> getBoardTopN(String order, int limit) {
        return boardMapper.getBoardTopN(order, limit);
    }

    @Override
    public int updateResumeBoard(ResumeBoard b) {
        System.out.println(b.getResumeNo());
        return boardMapper.updateResumeBoard(b);
    }

    @Override
    public int deleteResumeBoard(int b) {
        return boardMapper.deleteResumeBoard(b);
    }

    @Override
    public int selectFeedbackCount(int bno) {
        return boardMapper.selectFeedbackCount(bno);
    }

    @Override
    public List<Feedback> selectFeedbackList(PageInfo pi, int bno) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return boardMapper.selectFeedbackList(rowBounds, bno);
    }

    @Override
    public Feedback selectFeedback(int bno) {
        return boardMapper.selectFeedback(bno);
    }

    @Override
    public Setting selectSiteSetting() {
        return boardMapper.selectSiteSetting();
    }

    @Override
    public int insertSetting(Setting setting) {
        return boardMapper.insertSetting(setting);
    }

}
