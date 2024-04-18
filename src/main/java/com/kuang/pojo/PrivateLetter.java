package com.kuang.pojo;

import java.util.Date;

public class PrivateLetter {
    private int privateLetterId;
    private int sendId;
    private int receiveId;
    private String content;
    private Date time;
    private int isReceive;

    public PrivateLetter() {

    }

    public PrivateLetter(int privateLetterId, int sendId, int receiveId, String content, Date time, int isReceive) {
        this.privateLetterId = privateLetterId;
        this.sendId = sendId;
        this.receiveId = receiveId;
        this.content = content;
        this.time = time;
        this.isReceive = isReceive;
    }

    public int getPrivateLetterId() {
        return privateLetterId;
    }

    public void setPrivateLetterId(int privateLetterId) {
        this.privateLetterId = privateLetterId;
    }

    public int getSendId() {
        return sendId;
    }

    public void setSendId(int sendId) {
        this.sendId = sendId;
    }

    public int getReceiveId() {
        return receiveId;
    }

    public void setReceiveId(int receiveId) {
        this.receiveId = receiveId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getIsReceive() {
        return isReceive;
    }

    public void setIsReceive(int isReceive) {
        this.isReceive = isReceive;
    }

    @Override
    public String toString() {
        return "privateLetter{" +
                "privateLetterId=" + privateLetterId +
                ", sendId=" + sendId +
                ", receiveId=" + receiveId +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", isReceive=" + isReceive +
                '}';
    }
}
