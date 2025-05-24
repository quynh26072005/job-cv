package com.example.demo.service;

import com.example.demo.dao.JobPostingsDAO;
import com.example.demo.dto.JobPosting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostingsService {

    private final JobPostingsDAO jobPostingsDAO;

    @Autowired
    public JobPostingsService(JobPostingsDAO jobPostingsDAO) {
        this.jobPostingsDAO = jobPostingsDAO;
    }

    public List<JobPosting> getAllJobPostingsWithCompany() {
        return jobPostingsDAO.findAllWithCompanyName();
    }
}
