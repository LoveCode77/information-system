package com.kuang.dao;

import com.kuang.pojo.Information;

import java.util.List;

public interface InformationMapper {

    Information queryById(int id);

    int insertInformation(Information information);
    int updateInformation(Information information);
}
