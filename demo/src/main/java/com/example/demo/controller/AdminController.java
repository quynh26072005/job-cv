package com.example.demo.controller;

import com.example.demo.dto.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String home(Model model, HttpSession session) {

        if (session.getAttribute("account") == null) {
            return "redirect:/login";
        }

        // Kiểm tra quyền truy cập của người dùng
        User user = (User) session.getAttribute("account");
        if (user == null || !user.getRoles().stream().anyMatch(role -> role.getRoleName().equals("EMPLOYER"))) {
            return "redirect:/index";
        }

        return "admin/admin";
    }

    @GetMapping("/loginCompany")
    public String company(Model model) {

        return "loginCompany";
    }
}
