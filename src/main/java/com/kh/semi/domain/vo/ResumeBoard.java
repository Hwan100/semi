package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class ResumeBoard {
    private int resumeNo;
    private int userNo;
    private int type;
    private String title;
    private String changeName;
    private String originName;
    private Date createDate;
    private Date updateDate;
}
