package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Reply {
    private int replyNo;
    private String content;
    private Date date;
    private int userNo;
    private int boardNo;
    REPLY_NO
            CONTENT
    CREATE_DATE
            USER_NO
    BOARD_NO

}
