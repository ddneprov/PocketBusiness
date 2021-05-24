package com.example.serverPocketBusiness.dto;

import com.example.serverPocketBusiness.entity.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserDto {

    private Integer userId;
    private String userName;
    private String userSurname;
    private String userPatronymic;
    private String userLogin;
    private String userRole;

    public User toUser(){
        User user = new User();
        user.setUserId(userId);
        user.setUserName(userName);
        user.setUserSurname(userSurname);
        user.setUserPatronymic(userPatronymic);
        user.setUserLogin(userLogin);
        user.setUserRole(userRole);
        return user;
    }

    public static UserDto fromUser(User user) {
        UserDto userDto = new UserDto();
        userDto.setUserId(user.getUserId());
        userDto.setUserName(user.getUserName());
        userDto.setUserSurname(user.getUserSurname());
        userDto.setUserPatronymic(user.getUserPatronymic());
        userDto.setUserLogin(user.getUserLogin());
        userDto.setUserRole(user.getUserRole());
        return userDto;
    }
}
