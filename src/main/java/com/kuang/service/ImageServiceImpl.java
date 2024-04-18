package com.kuang.service;

import com.kuang.dao.ImageMapper;
import com.kuang.pojo.Image;

import java.util.List;

public class ImageServiceImpl implements ImageService {

    private ImageMapper imageMapper;


    public void setImageMapper(ImageMapper imageMapper) {
        this.imageMapper = imageMapper;
    }


    @Override
    public List<Image> queryAll() {
        return imageMapper.queryAll();
    }

    @Override
    public Image queryImageById(int id) {
        return imageMapper.queryImageById(id);
    }

    @Override
    public int addImage(Image image) {
        return imageMapper.addImage(image);
    }

    @Override
    public int updateImage(Image image) {
        return imageMapper.updateImage(image);
    }

    @Override
    public int deleteImage(int imageId) {
        return imageMapper.deleteImage(imageId);
    }
}
