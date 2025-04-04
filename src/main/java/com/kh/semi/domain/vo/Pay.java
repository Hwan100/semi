package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Pay {
    private int payNo;
    private Date payDate;
    private String bankName;
    private String accountNumber;
    private int requiredDays;
    private int actualDays;
    private int attendanceRate;
    private String amount;
    private String note;
    private int userNo;
}
