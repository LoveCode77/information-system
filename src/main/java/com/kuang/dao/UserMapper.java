package com.kuang.dao;

import com.kuang.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    List<User> queryAllUsers();
    User queryUserById(int id);

    User queryByUserNameAndPassword(Map<String,String> map);
    List<User> query(User user);

    int  addUser(User user);
    int deleteUser(int id);
    int updataUser(User user);

}
