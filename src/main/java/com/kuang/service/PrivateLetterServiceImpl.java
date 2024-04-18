package com.kuang.service;

import com.kuang.dao.PrivateLetterMapper;
import com.kuang.pojo.PrivateLetter;

import java.util.List;

public class PrivateLetterServiceImpl implements PrivateLetterService
{
    PrivateLetterMapper privateLetterMapper;

    public void setPrivateLetterMapper(PrivateLetterMapper privateLetterMapper) {
        this.privateLetterMapper = privateLetterMapper;
    }

    @Override
    public List<PrivateLetter> query(PrivateLetter privateLetter) {
        return privateLetterMapper.query(privateLetter);
    }

    @Override
    public List<PrivateLetter> queryForLetter(PrivateLetter privateLetter) {
        return privateLetterMapper.queryForLetter(privateLetter);
    }

    @Override
    public List<PrivateLetter> queryAllChat(int id) {
        return privateLetterMapper.queryAllChat(id);
    }

    @Override
    public int insertPrivateLetter(PrivateLetter privateLetter) {
        return privateLetterMapper.insertPrivateLetter(privateLetter);
    }

    @Override
    public int deletePrivateLetter(int privateLetterId) {
        return privateLetterMapper.deletePrivateLetter(privateLetterId);
    }

    @Override
    public int updatePrivateLetter(PrivateLetter privateLetter) {
        return privateLetterMapper.updatePrivateLetter(privateLetter);
    }
}
