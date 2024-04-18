package com.kuang.service;

import com.kuang.pojo.Punishment;

import java.util.List;

public interface PunishmentService {

    public List<Punishment> query(Punishment punishment);

    public int insert(Punishment punishment);

    public int update(Punishment punishment);
}
