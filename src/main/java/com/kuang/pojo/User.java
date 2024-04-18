package com.kuang.pojo;

public class User {
    private int id;
    private String studentNumber;
    private String password;
    private int type;
    private String userName;

    public User(String studentNumber, String password, int type, String userName) {
        this.studentNumber = studentNumber;
        this.password = password;
        this.type = type;
        this.userName = userName;
    }


    public User(int id, String studentNumber, String password, int type, String userName) {
        this.id = id;
        this.studentNumber = studentNumber;
        this.password = password;
        this.type = type;
        this.userName = userName;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", studentNumber='" + studentNumber + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                ", userName='" + userName + '\'' +
                '}';
    }
}
