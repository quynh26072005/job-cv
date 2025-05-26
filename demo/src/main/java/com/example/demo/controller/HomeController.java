package com.example.demo.controller;

import com.example.demo.dto.JobPosting;
import com.example.demo.service.JobService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final JobService jobService;


    @GetMapping({"/", "/home"})
    public String home(Model model) {
        List<JobPosting> jobs = jobService.getAllJobPostings();

        List<Map<String, Object>> jobWithDeadline = jobs.stream().map(job -> {
            Map<String, Object> map = new HashMap<>();
            map.put("job", job);
            if (job.getDeadline() != null) {
                long daysLeft = ChronoUnit.DAYS.between(LocalDate.now(), job.getDeadline());
                map.put("daysLeft", daysLeft);
            } else {
                map.put("daysLeft", null);
            }
            return map;
        }).toList();

        model.addAttribute("jobs", jobWithDeadline);
        return "index";
    }


}
