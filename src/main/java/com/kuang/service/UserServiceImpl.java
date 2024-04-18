package com.kuang.service;

import com.kuang.dao.BookMapper;
import com.kuang.dao.UserMapper;
import com.kuang.pojo.User;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> query(User user) {
        return userMapper.query(user);
    }

    @Override
    public List<User> queryAllUsers() {
        return userMapper.queryAllUsers();
    }

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public User queryByUserNameAndPassword(Map<String, String> map) {
        return userMapper.queryByUserNameAndPassword(map);
    }


    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public int updataUser(User user) {
        return userMapper.updataUser(user);
    }

}
