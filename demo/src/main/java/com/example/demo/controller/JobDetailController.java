package com.example.demo.controller;

import com.example.demo.dto.JobPosting;
import com.example.demo.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
public class JobDetailController {

    private final JobService jobService;

    @Autowired
    public JobDetailController(JobService jobService) {
        this.jobService = jobService;
    }

    @GetMapping("/jobDetail")
    public String showJobDetail(@RequestParam("id") int jobId, Model model) {
        // Lấy tất cả các job từ service
        List<JobPosting> allJobs = jobService.getAllJobPostings();

        // Tìm job theo jobId
        JobPosting job = allJobs.stream()
                .filter(j -> j.getJobId() == jobId)
                .findFirst()
                .orElse(null);

        if (job == null) {
            return "error"; // Trả về trang lỗi nếu không tìm thấy job
        }

        // Tính daysLeft dựa trên ngày hiện tại (26/05/2025)
        LocalDate currentDate = LocalDate.of(2025, 5, 26); // Ngày hiện tại
        long daysLeft = ChronoUnit.DAYS.between(currentDate, job.getDeadline());
        model.addAttribute("daysLeft", daysLeft > 0 ? daysLeft : 0); // Đảm bảo daysLeft không âm
        model.addAttribute("job", job);

        return "jobDetail"; // Tên file Thymeleaf (jobDetail.html)
    }
}
