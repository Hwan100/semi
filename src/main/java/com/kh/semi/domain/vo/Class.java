package com.kh.semi.domain.vo;

import  lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Class {
    private int classNo;
    private String className;
    private Date startDate;
    private Date endDate;
    private String courseName;
    private String description;
    private int userNo;
    private String roomName;
    private int progress;
    private String userName;    // 강사 이름
    private String classTime;   // 수업시간 (예: 월 09:00~18:00 / 수 09:00~18:00)

}
