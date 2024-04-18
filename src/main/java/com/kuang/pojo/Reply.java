package com.kuang.pojo;

public class Reply {
    private int replyId;
    private int topicId;
    private int id;
    private String replyContexts;

    public Reply() {
    }

    public Reply(int replyId, int topicId, int id, String replyContexts) {
        this.replyId = replyId;
        this.topicId = topicId;
        this.id = id;
        this.replyContexts = replyContexts;
    }

    public Reply(int topicId, int id, String replyContexts) {
        this.topicId = topicId;
        this.id = id;
        this.replyContexts = replyContexts;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReplyContexts() {
        return replyContexts;
    }

    public void setReplyContexts(String replyContexts) {
        this.replyContexts = replyContexts;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyId=" + replyId +
                ", topicId=" + topicId +
                ", id=" + id +
                ", replyContexts='" + replyContexts + '\'' +
                '}';
    }
}
