package com.example.demo.service;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dto.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AccountService {
    private final AccountDAO accountDAO;

    public User login(String username, String password) {
        User acc = accountDAO.findByUsername(username);
        if (acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    public boolean register(User account) {
        return accountDAO.create(account);
    }
}
