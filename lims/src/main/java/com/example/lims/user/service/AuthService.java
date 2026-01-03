package com.example.lims.user.service;

import com.example.lims.user.bean.User;
import com.example.lims.user.dao.AuthDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthService {

    @Autowired
    private AuthDao authDao;

    public Optional<User> authenticate(String email, String password) {
        Optional<User> userOpt = authDao.findByEmail(email);
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            return userOpt;
        }
        return Optional.empty();
    }

    public boolean registerUser(User user) {
        try {
            if (authDao.existsByUsername(user.getUsername())) {
                return false;
            }
            authDao.save(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
