package com.kuang.service;

import com.kuang.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<User> query(User user);

    List<User> queryAllUsers();

    User queryUserById(int id);

    User queryByUserNameAndPassword(Map<String,String> map);

    int  addUser(User user);
    int deleteUser(int id);
    int updataUser(User user);

}
