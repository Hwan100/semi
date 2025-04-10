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
    private String originName;
    private String changeName;
    private int late;
    private int absent;
}
