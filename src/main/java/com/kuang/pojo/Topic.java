package com.kuang.pojo;

import java.util.Date;

public class Topic {
//    主贴编号  topicId
//    主贴板块号：topicSectonId
//    主贴用户编号（发帖人):id 参照表user
//    主贴回复次数：topicReplyCount
//    主贴表情：topicImage
//    主题标题：topicTitle
//    主贴内容：topicContexts
//    主贴回复次数：topicTime
//    主贴最后点击时间：topicLastClickTime
    private int topicId;
    private int topicSectonId;
    private int id;
    private int topicReplyCount;
    private int topicImage;
    private String topicTitle;
    private String topicContexts;
    private int topicTime;
    private Date topicLastClickTime;

    public Topic() {
    }

    public Topic(int topicSectonId, int id, int topicReplyCount, int topicImage, String topicTitle, String topicContexts, int topicTime, Date topicLastClickTime) {
        this.topicSectonId = topicSectonId;
        this.id = id;
        this.topicReplyCount = topicReplyCount;
        this.topicImage = topicImage;
        this.topicTitle = topicTitle;
        this.topicContexts = topicContexts;
        this.topicTime = topicTime;
        this.topicLastClickTime = topicLastClickTime;
    }

    public Topic(int topicId, int topicSectonId, int id, int topicReplyCount, int topicImage, String topicTitle, String topicContexts, int topicTime, Date topicLastClickTime) {

        this.topicId = topicId;
        this.topicSectonId = topicSectonId;
        this.id = id;
        this.topicReplyCount = topicReplyCount;
        this.topicImage = topicImage;
        this.topicTitle = topicTitle;
        this.topicContexts = topicContexts;
        this.topicTime = topicTime;
        this.topicLastClickTime = topicLastClickTime;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getTopicSectonId() {
        return topicSectonId;
    }

    public void setTopicSectonId(int topicSectonId) {
        this.topicSectonId = topicSectonId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTopicReplyCount() {
        return topicReplyCount;
    }

    public void setTopicReplyCount(int topicReplyCount) {
        this.topicReplyCount = topicReplyCount;
    }

    public int getTopicImage() {
        return topicImage;
    }

    public void setTopicImage(int topicImage) {
        this.topicImage = topicImage;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getTopicContexts() {
        return topicContexts;
    }

    public void setTopicContexts(String topicContexts) {
        this.topicContexts = topicContexts;
    }

    public int getTopicTime() {
        return topicTime;
    }

    public void setTopicTime(int topicTime) {
        this.topicTime = topicTime;
    }

    public Date getTopicLastClickTime() {
        return topicLastClickTime;
    }

    public void setTopicLastClickTime(Date topicLastClickTime) {
        this.topicLastClickTime = topicLastClickTime;
    }

    @Override
    public String toString() {
        return "topic{" +
                "topicId=" + topicId +
                ", topicSectonId=" + topicSectonId +
                ", id=" + id +
                ", topicReplyCount=" + topicReplyCount +
                ", topicImage=" + topicImage +
                ", topicTitle='" + topicTitle + '\'' +
                ", topicContexts='" + topicContexts + '\'' +
                ", topicTime=" + topicTime +
                ", topicLastClickTime=" + topicLastClickTime +
                '}';
    }
}
