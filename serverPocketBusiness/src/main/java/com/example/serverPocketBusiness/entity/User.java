package com.example.serverPocketBusiness.entity;


import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "user_table")
public class User {

    @Id
    @GeneratedValue
    private Integer userId;

    private String userName;

    private String userSurname;

    private String userPatronymic;

    private String userLogin;

    private String userPassword;

    private String userRole;

    public User(Integer userId, String userName, String userSurname, String userPatronymic, String userLogin, String userPassword, String userRole){
        this.userId = userId;
        this.userName = userName;
        this.userSurname = userSurname;
        this.userPatronymic = userPatronymic;
        this.userLogin = userLogin;
        this.userPassword = userPassword;
        this.userRole = userRole;
    }

    public User(String userName, String userSurname, String userPatronymic, String userLogin, String userPassword, String userRole){
        this.userName = userName;
        this.userSurname = userSurname;
        this.userPatronymic = userPatronymic;
        this.userLogin = userLogin;
        this.userPassword = userPassword;
        this.userRole = userRole;
    }

    public User() {}

    public Integer getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String name) {
        this.userName = name;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String surname) {
        this.userSurname = surname;
    }

    public String getUserPatronymic() {
        return userPatronymic;
    }

    public void setUserPatronymic(String secondName) {
        this.userPatronymic = secondName;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String login) {
        this.userLogin = login;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String password) {
        this.userPassword = password;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
}