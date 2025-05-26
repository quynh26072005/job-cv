package com.example.demo.service;

import com.example.demo.dao.JobDAO;
import com.example.demo.dto.JobPosting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {

    private final JobDAO jobDAO;

    @Autowired
    public JobService(JobDAO jobDAO) {
        this.jobDAO = jobDAO;
    }

    public List<JobPosting> getAllJobPostings() {
        return jobDAO.findAllJobPostings();
    }
}
