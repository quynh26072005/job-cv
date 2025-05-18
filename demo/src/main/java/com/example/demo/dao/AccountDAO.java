package com.example.demo.dao;

import com.example.demo.dto.User;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountDAO  extends  JDBCUtil{

    public List<User> findAll() {
        List<User> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User acc = new User();
                acc.setUserId(rs.getInt("user_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password_hash"));
                acc.setEmail(rs.getString("email"));
                accounts.add(acc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accounts;
    }

    public boolean create(User account) {
        String sql = "INSERT INTO Users (username, password_hash, email) VALUES (?, ?, ?)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, account.getUsername());
            stmt.setString(2, account.getPassword());
            stmt.setString(3, account.getEmail());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User findByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User acc = new User();
                    acc.setUserId(rs.getInt("user_id"));
                    acc.setUsername(rs.getString("username"));
                    acc.setPassword(rs.getString("password_hash"));
                    acc.setEmail(rs.getString("email"));
                    return acc;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
