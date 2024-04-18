package com.kuang.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Punishment {
    private int punishmentId;
    private int id;
    private int punishmentUser;
    private String punishmentContent;
    private int punishmentType;
    private Date punishmentBegin;
    private Date punishmentOver;
    private String punishmentTime;
    private int outdated;

}

