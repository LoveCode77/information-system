package com.kuang.pojo;

public class Word {

    private int wordId;
    private int rank;
    private String wordContent;
    private int count;



    public Word() {
    }


    public Word(int rank, String wordContent) {
        this.rank = rank;
        this.wordContent = wordContent;
    }

    public Word(int rank, String wordContent, int count) {
        this.rank = rank;
        this.wordContent = wordContent;
        this.count = count;
    }

    public Word(int wordId, int rank, String wordContent, int count) {
        this.wordId = wordId;
        this.rank = rank;
        this.wordContent = wordContent;
        this.count = count;
    }

    public int getWordId() {
        return wordId;
    }

    public void setWordId(int wordId) {
        this.wordId = wordId;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getWordContent() {
        return wordContent;
    }

    public void setWordContent(String wordContent) {
        this.wordContent = wordContent;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Word{" +
                "wordId=" + wordId +
                ", rank=" + rank +
                ", wordContent='" + wordContent + '\'' +
                ", count=" + count +
                '}';
    }

}
