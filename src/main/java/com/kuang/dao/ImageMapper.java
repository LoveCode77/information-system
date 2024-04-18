package com.kuang.dao;

import com.kuang.pojo.Image;

import java.util.List;

public interface ImageMapper {
    //查询
        //用的不多
    List<Image> queryAll();
    //主要是这个
    Image queryImageById(int id);

    //添加
    int addImage(Image image);
    //修改
    int updateImage(Image image);
    //删除
    int deleteImage(int imageId);
}
