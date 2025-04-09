package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Schedule {
    private int scheduleNo;
    private String title;
    private Date startDate;
    private Date endDate;
    private String description;
    private int classNo;
    private String type;
}
