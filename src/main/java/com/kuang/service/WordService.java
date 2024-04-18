package com.kuang.service;

import com.kuang.pojo.Word;

import java.util.List;

public interface WordService {
    List<Word> words(Word word);
    int insertWord(Word word);
    int updateWord(Word word);
    int deleteWord(int wordId);
}
