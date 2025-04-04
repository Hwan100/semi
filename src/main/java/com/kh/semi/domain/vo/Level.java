package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Level {
    private int levelNo;
    private int type;
    private int category;
    private String startDate;
    private String endDate;
    private int daysDeducted;
    private String reason;
    private int status;
    private String filePath;
    private Date requestDate;
    private Date approveDate;
    private String rejectReason;
    private int userNo;
}
