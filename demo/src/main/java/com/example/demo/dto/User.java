package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int userId;
    private String username;
    private String password;
    private String email;
    private String companyName;
    private List<Role> roles;
}
