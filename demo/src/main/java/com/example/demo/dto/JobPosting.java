package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JobPosting {
    private int jobId;
    private String jobTitle;
    private int userId;
    private int categoryId;
    private String companyName;
    private double salaryMin;
    private double salaryMax;
    private String location;
    private String companyLogo;
    private java.time.LocalDate deadline;
    private String jobDescription;

    @Override
    public String toString() {
        return "JobPosting{" +
                "jobId=" + jobId +
                ", jobTitle='" + jobTitle + '\'' +
                ", userId=" + userId +
                ", categoryId=" + categoryId +
                ", companyName='" + companyName + '\'' +
                ", salaryMin=" + salaryMin +
                ", salaryMax=" + salaryMax +
                ", location='" + location + '\'' +
                ", companyLogo='" + companyLogo + '\'' +
                ", deadline=" + deadline +
                ", jobDescription='" + jobDescription + '\'' +
                '}';
    }
}
