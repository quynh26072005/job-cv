package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobDetailController {

    @GetMapping("/jobDetail")
    public String jobDetailPage(Model model) {
        return "jobDetail";
    }
}
