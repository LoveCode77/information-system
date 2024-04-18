package com.kuang.service;

import com.kuang.dao.WordMapper;
import com.kuang.pojo.Word;

import java.util.List;

public class WordServiceImpl implements WordService{

    private WordMapper wordMapper;

    public void setWordMapper(WordMapper wordMapper) {
        this.wordMapper = wordMapper;
    }

    @Override
    public List<Word> words(Word word) {
        return wordMapper.words(word);
    }

    @Override
    public int insertWord(Word word) {
        return wordMapper.insertWord(word);
    }

    @Override
    public int updateWord(Word word) {
        return wordMapper.updateWord(word);
    }

    @Override
    public int deleteWord(int wordId) {
        return wordMapper.deleteWord(wordId);
    }
}
