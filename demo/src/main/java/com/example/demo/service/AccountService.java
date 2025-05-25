package com.example.demo.service;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.RoleUserDAO;
import com.example.demo.dto.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AccountService {
    private final AccountDAO accountDAO;
    private final RoleUserDAO roleUserDAO;

    public User login(String username, String password) {
        User acc = accountDAO.findByUsername(username);
        if (acc != null && acc.getPassword().equals(password)) {
            return acc;
        }
        return null;
    }

    public boolean register(User account, String roleName) {
        int userId = accountDAO.create(account);

        if (userId == -1) return false;

        int roleId;
        if ("user".equalsIgnoreCase(roleName)) {
            roleId = 1;
        } else if ("employer".equalsIgnoreCase(roleName)) {
            roleId = 2;
        } else {
            return false; // role không hợp lệ
        }

        return roleUserDAO.insert(userId, roleId);
    }


}
