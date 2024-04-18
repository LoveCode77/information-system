package com.kuang.pojo;

public class Information {
    private int informationId;
    private int id;
    private String signature;
    private String eMail;
    private String qq;
    private String phone;
    private String wechat;

    public Information() {

    }


    public Information(int informationId, int id, String signature, String eMail, String qq, String phone, String wechat) {
        this.informationId = informationId;
        this.id = id;
        this.signature = signature;
        this.eMail = eMail;
        this.qq = qq;
        this.phone = phone;
        this.wechat = wechat;
    }

    public int getInformationId() {
        return informationId;
    }

    public void setInformationId(int informationId) {
        this.informationId = informationId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    @Override
    public String toString() {
        return "Information{" +
                "informationId=" + informationId +
                ", id=" + id +
                ", signature='" + signature + '\'' +
                ", eMail='" + eMail + '\'' +
                ", qq='" + qq + '\'' +
                ", phone='" + phone + '\'' +
                ", wechat='" + wechat + '\'' +
                '}';
    }
}
