package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Feedback {
    private int feedbackNo;
    private String content;
    private Date writeDate;
    private int resumeNo;
    private int userNo;
    private String title;
}
