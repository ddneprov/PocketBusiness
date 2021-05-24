package com.example.serverPocketBusiness.dto;


import lombok.Data;

@Data
public class AuthenticationRequestDto {
    private String userLogin;
    private String userPassword;
}
