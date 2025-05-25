package com.example.demo.dao;

import com.example.demo.dto.Role;
import com.example.demo.dto.User;
import org.springframework.stereotype.Repository;

import java.sql.*;
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

    public int create(User account) {
        String sql = "INSERT INTO Users (username, password_hash, email) VALUES (?, ?, ?)";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, account.getUsername());
            stmt.setString(2, account.getPassword());
            stmt.setString(3, account.getEmail());

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }



    public User findByUsername(String username) {
        String sql = """
        SELECT 
            u.user_id, u.username, u.password_hash, u.email, u.company_name,
            r.role_id, r.role_name
        FROM Users u
        LEFT JOIN Role_User ru ON u.user_id = ru.user_id
        LEFT JOIN Role r ON ru.role_id = r.role_id
        WHERE u.username = ?
    """;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                User user = null;
                List<Role> roles = new ArrayList<>();

                while (rs.next()) {
                    if (user == null) {
                        user = new User();
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password_hash"));
                        user.setEmail(rs.getString("email"));
                        user.setCompanyName(rs.getString("company_name"));
                    }

                    int roleId = rs.getInt("role_id");
                    String roleName = rs.getString("role_name");

                    if (roleName != null) {
                        Role role = new Role(roleId, roleName);
                        roles.add(role);
                    }
                }

                if (user != null) {
                    user.setRoles(roles); // Giả sử bạn có phương thức này
                }

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
