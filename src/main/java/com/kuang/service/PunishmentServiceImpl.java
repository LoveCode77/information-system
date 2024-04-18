package com.kuang.service;

import com.kuang.dao.PunishmentMapper;
import com.kuang.pojo.Punishment;

import java.util.List;

public class PunishmentServiceImpl implements PunishmentService{

    PunishmentMapper punishmentMapper;

    public void setPunishmentMapper(PunishmentMapper punishmentMapper) {
        this.punishmentMapper = punishmentMapper;
    }

    @Override
    public List<Punishment> query(Punishment punishment) {
        return punishmentMapper.query(punishment);
    }

    @Override
    public int insert(Punishment punishment) {
        return punishmentMapper.insert(punishment);
    }

    @Override
    public int update(Punishment punishment) {
        return punishmentMapper.update(punishment);
    }
}
