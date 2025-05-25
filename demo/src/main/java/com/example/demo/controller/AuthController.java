package com.example.demo.controller;

import com.example.demo.dto.User;
import com.example.demo.service.AccountService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final AccountService accountService ;

    @PostMapping("/doLogin")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        System.out.println("Login attempt with username: " + username);
        User acc = accountService.login(username, password);
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
                           @RequestParam String role, // <-- thêm dòng này
                           Model model) {

        User acc = new User();
        acc.setUsername(username);
        acc.setPassword(password);
        acc.setEmail(email);

        boolean success = accountService.register(acc, role); // <-- truyền role

        if (success) {
            model.addAttribute("success", "Register successful! Please login.");
        } else {
            model.addAttribute("error", "Register failed!");
        }
        return "login";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Xóa toàn bộ session
        return "redirect:/home"; // Trở về trang chủ
    }

}
