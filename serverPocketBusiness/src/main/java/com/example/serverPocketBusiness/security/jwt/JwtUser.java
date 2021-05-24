package com.example.serverPocketBusiness.security.jwt;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

public class JwtUser implements UserDetails {

    private final Integer userId;
    private final String userName;
    private final String userSurname;
    private final String userPatronymic;
    private final String userLogin;
    private final String userPassword;
    private final String userRole;
    private final boolean isEnable;
    private final Collection<? extends GrantedAuthority> authorities;


    public JwtUser(Integer userId, String userName, String userSurname, String userPatronymic, String userLogin,
                   String userPassword, String userRole, boolean isEnable, Collection<? extends GrantedAuthority> authorities) {
        this.userId = userId;
        this.userName = userName;
        this.userSurname = userSurname;
        this.userPatronymic = userPatronymic;
        this.userLogin = userLogin;
        this.userPassword = userPassword;
        this.userRole = userRole;
        this.isEnable = isEnable;
        this.authorities = authorities;
    }


    @JsonIgnore
    public Integer getUserId() { return userId; }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { return authorities; }

    @JsonIgnore
    @Override
    public String getPassword() {
        return userPassword;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return true;
    }


    @Override
    public boolean isEnabled() {
        return isEnable;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public String getUserPatronymic() {
        return userPatronymic;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public String getUserRole() {
        return userRole;
    }
}
