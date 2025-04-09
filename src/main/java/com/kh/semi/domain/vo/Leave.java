package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Leave {

    private int leaveNo;
    private int type; //휴가 1 | 병가 2
    private int category; //종일 1 | 오전 2 | 오후 3
    private String startDate;
    private String endDate;
    private int daysDeducted;
    private String reason;
    private int status; //요청중 3 | 승인 1 | 반려 2
    private String changeName;
    private String originName;
    private Date requestDate;
    private Date approveDate;
    private String rejectReason;
    private int userNo;
    private int classNo;

    private String className;
    private String roomName;
}
