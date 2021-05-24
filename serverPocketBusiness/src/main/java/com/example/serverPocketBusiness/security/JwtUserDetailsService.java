package com.example.serverPocketBusiness.security;


import com.example.serverPocketBusiness.entity.User;
import com.example.serverPocketBusiness.security.jwt.JwtUser;
import com.example.serverPocketBusiness.security.jwt.JwtUserFactory;

import com.example.serverPocketBusiness.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



@Service
@Slf4j
public class JwtUserDetailsService implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public JwtUserDetailsService(UserService userService) {
        this.userService = userService;
    }


    @Override
    public UserDetails loadUserByUsername(String userLogin) throws UsernameNotFoundException {
        User user = userService.findUserByUserLogin(userLogin);

        if(user == null)
            throw new UsernameNotFoundException("User with userLogin: " + userLogin + " not found");

        JwtUser jwtUser = JwtUserFactory.create(user);
        System.out.println("JWT USER PASSWORD ->" + jwtUser.getPassword());
        log.info("loadUserByUsername -> user with userLogin = {} successfully loaded", userLogin);
        return jwtUser;
    }
}
