package com.kh.semi.domain.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Certificate {
    private int certNo;
    private String unitName;
    private String evalDate;
    private int mainScore;
    private int finalScore;
    private int certLevel;
    private String result;
    private String changeName;
    private String originName;

    private int userNo;
}
