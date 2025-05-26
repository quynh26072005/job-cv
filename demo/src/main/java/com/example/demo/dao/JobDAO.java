package com.example.demo.dao;

import com.example.demo.dto.JobPosting;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class JobDAO extends JDBCUtil {

    public List<JobPosting> findAllJobPostings() {
        List<JobPosting> postings = new ArrayList<>();
        String sql = """
        SELECT * FROM Job_Postings
    """;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                JobPosting job = new JobPosting();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setUserId(rs.getInt("user_id"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setSalaryMin(rs.getDouble("salary_min"));
                job.setSalaryMax(rs.getDouble("salary_max"));
                job.setLocation(rs.getString("location"));
                job.setDeadline(rs.getDate("deadline").toLocalDate());
                job.setCompanyLogo(rs.getString("company_logo_url"));
                job.setCompanyName(rs.getString("company_name"));
                postings.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return postings;
    }

}
