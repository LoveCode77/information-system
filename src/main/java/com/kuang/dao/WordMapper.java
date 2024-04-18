package com.kuang.dao;

import com.kuang.pojo.Word;

import java.util.List;

public interface WordMapper {
    List<Word> words(Word word);
    int insertWord(Word word);
    int updateWord(Word word);
    int deleteWord(int wordId);
}
