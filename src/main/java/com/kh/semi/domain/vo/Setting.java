package com.kh.semi.domain.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Setting {
    private int settingNo;
    private String siteName;
    private String logoPath;
    private int lateAbsentRatio;
}
