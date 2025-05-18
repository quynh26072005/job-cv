package com.example.demo.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InstructController {

    @GetMapping("/partTime")
    public String partTimePage(Model model, HttpSession session) {
        return "partTime";
    }

    @GetMapping("/remote")
    public String remotePage(Model model, HttpSession session) {
        return "remote";
    }

    @GetMapping("/jobb")
    public String jobbPage(Model model, HttpSession session) {
        return "jobb";
    }
}
