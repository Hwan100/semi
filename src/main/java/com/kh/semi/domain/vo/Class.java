package com.kh.semi.domain.vo;

import lombok.*;

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
}
