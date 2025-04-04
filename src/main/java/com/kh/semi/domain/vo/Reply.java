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
 }
