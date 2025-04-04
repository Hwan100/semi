package com.kh.semi.domain.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Attendance {
    private int attendanceNo;
    private String classDate;
    private String checkInTime;
    private String checkOutTime;
    private String status;
    private int userNo;
}
