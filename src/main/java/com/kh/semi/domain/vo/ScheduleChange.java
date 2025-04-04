package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class ScheduleChange {
    private int changeNo;
    private String reason;
    private Date requestDate;
    private String startDate;
    private String endDate;
    private int classNo;
    private int userNo;
}
