package com.example.demo.service;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dto.Account;

public class AccountService {
    private final AccountDAO accountDAO;

    public AccountService() {
        this.accountDAO = new AccountDAO(); // hoặc inject nếu dùng Spring context
    }

    public Account login(String username, String password) {
        Account acc = accountDAO.findByUsername(username);
        if (acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    public boolean register(Account account) {
        return accountDAO.create(account);
    }
}
