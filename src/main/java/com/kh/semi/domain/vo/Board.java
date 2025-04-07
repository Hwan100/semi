package com.kh.semi.domain.vo;


import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Board {
    private int boardNo;
    private String title;
    private String content;
    private Date createDate;
    private int count;
    private String branch;
    private int type;
    private String filePath;
    private int userNo;
    private int classNo;

    private String userName;
}
