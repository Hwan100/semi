package com.kh.semi.domain.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class ClassTime {
    private String classDate;
    private int classNo;
    private String classStartTime;
    private String classEndTime;
}
