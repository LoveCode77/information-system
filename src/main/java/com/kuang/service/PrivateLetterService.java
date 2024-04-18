package com.kuang.service;

import com.kuang.pojo.PrivateLetter;

import java.util.List;

public interface PrivateLetterService {

    List<PrivateLetter> query(PrivateLetter privateLetter);
    List<PrivateLetter> queryForLetter(PrivateLetter privateLetter);
    List<PrivateLetter> queryAllChat(int id);

    int insertPrivateLetter(PrivateLetter privateLetter);

    int deletePrivateLetter( int privateLetterId);

    int updatePrivateLetter(PrivateLetter privateLetter);
}
