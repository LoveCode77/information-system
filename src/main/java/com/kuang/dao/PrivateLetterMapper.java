package com.kuang.dao;

import com.kuang.pojo.PrivateLetter;

import java.util.List;

public interface PrivateLetterMapper {

    List<PrivateLetter> query(PrivateLetter privateLetter);
    List<PrivateLetter> queryForLetter(PrivateLetter privateLetter);
    List<PrivateLetter> queryAllChat(int id);


    int insertPrivateLetter(PrivateLetter privateLetter);

    int deletePrivateLetter( int privateLetterId);

    int updatePrivateLetter(PrivateLetter privateLetter);
}
