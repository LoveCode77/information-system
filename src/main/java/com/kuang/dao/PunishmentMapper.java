package com.kuang.dao;

import com.kuang.pojo.Punishment;

import java.util.List;

public interface PunishmentMapper {

    List<Punishment> query(Punishment punishment);

    int insert(Punishment punishment);

    int update(Punishment punishment);


}
