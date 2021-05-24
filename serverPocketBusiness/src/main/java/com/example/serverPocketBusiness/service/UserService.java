package com.example.serverPocketBusiness.service;


import com.example.serverPocketBusiness.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.ArrayList;
import java.util.List;

public interface UserService {

    String setNewUser(User user) throws JsonProcessingException;

    List<User> getAllUsers();

    User findUserById(Integer idUser);

    User findUserByUserLogin(String userLogin);

    String isUserExistCheck(ArrayList<String> userLogInfo);

    String resetUserLogin(ArrayList<String> userLogInfo);

    String resetUserPassword(ArrayList<String> userLogInfo);
}
