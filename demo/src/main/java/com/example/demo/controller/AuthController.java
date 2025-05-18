package com.example.demo.controller;

import com.example.demo.dto.Account;
import com.example.demo.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    private final AccountService accountService = new AccountService();

    @PostMapping("/doLogin")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        Account acc = accountService.login(username, password);
        if (acc != null) {
            session.setAttribute("account", acc);
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    @PostMapping("/doRegister")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String email,
                           Model model) {
        Account acc = new Account();
        acc.setUsername(username);
        acc.setPassword(password);
        acc.setEmail(email);

        boolean success = accountService.register(acc);
        if (success) {
            model.addAttribute("success", "Register successful! Please login.");
        } else {
            model.addAttribute("error", "Register failed!");
        }
        return "login";
    }
}
