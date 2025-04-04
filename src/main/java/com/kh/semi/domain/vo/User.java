package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class User {
    private int userNo;
    private int classNo;
    private String userId;
    private String userPwd;
    private String userName;
    private int role;
    private String phone;
    private String email;
    private String userAddress;
    private String userAddressDetail;
    private Date userBirth;
    private Date userJoinDate;
    private String status;
    private String userProfileImg;
    private int departmentNo;
}
