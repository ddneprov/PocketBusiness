package com.example.serverPocketBusiness.repository;


import com.example.serverPocketBusiness.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, String> {

    public List<User> findAll();
    public User findFirstByUserId(Integer userId);
    public User findFirstByUserLoginAndUserPassword(String userLogin, String userPassword);
    public User findUserByUserLogin(String userLogin);
}
