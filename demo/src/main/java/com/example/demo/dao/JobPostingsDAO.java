package com.example.demo.dao;

import com.example.demo.dto.JobPosting;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class JobPostingsDAO extends JDBCUtil {

    public List<JobPosting> findAllWithCompanyName() {
        List<JobPosting> postings = new ArrayList<>();
        String sql = """
            SELECT j.job_id, j.job_title, j.employer_id, j.category_id, 
                   e.company_name
            FROM Job j
            JOIN Employers e ON j.employer_id = e.employer_id
        """;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                JobPosting job = new JobPosting();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setEmployerId(rs.getInt("employer_id"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setCompanyName(rs.getString("company_name"));
                postings.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return postings;
    }
}
