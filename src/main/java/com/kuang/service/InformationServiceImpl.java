package com.kuang.service;

import com.kuang.dao.InformationMapper;
import com.kuang.pojo.Information;

public class InformationServiceImpl implements InformationService{

    private InformationMapper informationMapper;

    public void setInformationMapper(InformationMapper informationMapper) {
        this.informationMapper = informationMapper;
    }


    @Override
    public Information queryById(int id) {
        return informationMapper.queryById(id);
    }

    @Override
    public int insertInformation(Information information) {
        return informationMapper.insertInformation(information);
    }

    @Override
    public int updateInformation(Information information) {
        return informationMapper.updateInformation(information);
    }
}
