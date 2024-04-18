package com.kuang.service;

import com.kuang.pojo.Information;

public interface InformationService {
    Information queryById(int id);

    int insertInformation(Information information);
    int updateInformation(Information information);
}
