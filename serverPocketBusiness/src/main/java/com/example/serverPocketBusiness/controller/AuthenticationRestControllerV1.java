package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.User;
import com.example.serverPocketBusiness.security.jwt.JwtTokenProvider;
import com.example.serverPocketBusiness.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;



@RestController
@RequestMapping(value = "/api/v1/auth/")
public class AuthenticationRestControllerV1 {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider jwtTokenProvider;
    private final UserService userService;

    @Autowired
    public AuthenticationRestControllerV1(AuthenticationManager authenticationManager, JwtTokenProvider jwtTokenProvider, UserService userService) {
        this.authenticationManager = authenticationManager;
        this.jwtTokenProvider = jwtTokenProvider;
        this.userService = userService;
    }

    @GetMapping("login")
    //public ResponseEntity login(@RequestBody AuthenticationRequestDto requestDto) {
    public ResponseEntity login(@RequestParam String userLogin, @RequestParam String userPassword) {
        try {
            //String userLogin = requestDto.getUserLogin();
            //authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userLogin, requestDto.getUserPassword()));
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userLogin, userPassword
            ));
            User user = userService.findUserByUserLogin(userLogin);

            if (user == null) {
                throw new UsernameNotFoundException("User with username: " + userLogin + " not found");
            }

            String token = jwtTokenProvider.createToken(userLogin, user.getUserRole());

            Map<Object, Object> response = new HashMap<>();
            //TODO: переименовать поля на стороне бека
            response.put("firstName", user.getUserName());
            response.put("secondName", user.getUserSurname());
            response.put("patronymic", user.getUserPatronymic());
            response.put("crewRole", "КВС-инстр");
            response.put("standingFromDate", "2018-05-11");
            response.put("standingFromDateInRole", "2020-05-11");
            response.put("reliabilityIndex", "3");
            response.put("rewardsAndPunishments", "5");
            response.put("role", user.getUserRole());
            response.put("token", token);

            return ResponseEntity.ok(response);
        } catch (AuthenticationException e) {
            throw new BadCredentialsException("Invalid username or password");
        }
    }
}