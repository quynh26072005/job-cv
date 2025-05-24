package com.example.demo.controller;

import com.example.demo.dto.JobPosting;
import com.example.demo.service.JobPostingsService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final JobPostingsService jobPostingsService;


    @GetMapping("/home")
    public String home(Model model) {
        return "index";
    }

    @GetMapping("/jobs")
    public String getAllJobs(Model model) {
        List<JobPosting> jobs = jobPostingsService.getAllJobPostingsWithCompany();
        model.addAttribute("jobs", jobs);
        return "job_list"; // Đây là tên file HTML trong thư mục templates (job_list.html)
    }
}
