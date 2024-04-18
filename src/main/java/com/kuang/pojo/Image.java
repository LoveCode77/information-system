package com.kuang.pojo;

public class Image {
    private int imageId;
    private int id;
    private String imageAddress;

    public Image() {
    }

    public Image(int id, String imageAddress) {
        this.id = id;
        this.imageAddress = imageAddress;
    }

    public Image(int imageId, int id, String imageAddress) {
        this.imageId = imageId;
        this.id = id;
        this.imageAddress = imageAddress;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageAddress() {
        return imageAddress;
    }

    public void setImageAddress(String imageAddress) {
        this.imageAddress = imageAddress;
    }

    @Override
    public String toString() {
        return "image{" +
                "imageId=" + imageId +
                ", id=" + id +
                ", imageAddress='" + imageAddress + '\'' +
                '}';
    }
}
