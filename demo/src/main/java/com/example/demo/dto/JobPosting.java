package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JobPosting {
    private int jobId;
    private String jobTitle;
    private int employerId;
    private int categoryId;
    private String companyName;

}
