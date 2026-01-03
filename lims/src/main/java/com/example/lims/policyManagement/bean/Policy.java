package com.example.lims.policyManagement.bean;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "Policy")
public class Policy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer policyId;

    @Column(nullable = false, length = 50)
    private String policyNumber;

    @Column(precision = 10, scale = 2)
    private BigDecimal coverageAmount;

    @Column(precision = 10, scale = 2)
    private BigDecimal premiumAmount;

    private Integer termYears;

    private Date startDate;
    private Date endDate;

    @Column(columnDefinition = "ENUM('ACTIVE', 'LAPSED', 'MATURED')")
    private String policyStatus;

    public Policy() {}

    public Policy(Integer policyId, String policyNumber, BigDecimal coverageAmount, BigDecimal premiumAmount,
                  Integer termYears, Date startDate, Date endDate, String policyStatus) {
        this.policyId = policyId;
        this.policyNumber = policyNumber;
        this.coverageAmount = coverageAmount;
        this.premiumAmount = premiumAmount;
        this.termYears = termYears;
        this.startDate = startDate;
        this.endDate = endDate;
        this.policyStatus = policyStatus;
    }

    public Integer getPolicyId() { return policyId; }
    public void setPolicyId(Integer policyId) { this.policyId = policyId; }

    public String getPolicyNumber() { return policyNumber; }
    public void setPolicyNumber(String policyNumber) { this.policyNumber = policyNumber; }

    public BigDecimal getCoverageAmount() { return coverageAmount; }
    public void setCoverageAmount(BigDecimal coverageAmount) { this.coverageAmount = coverageAmount; }

    public BigDecimal getPremiumAmount() { return premiumAmount; }
    public void setPremiumAmount(BigDecimal premiumAmount) { this.premiumAmount = premiumAmount; }

    public Integer getTermYears() { return termYears; }
    public void setTermYears(Integer termYears) { this.termYears = termYears; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public String getPolicyStatus() { return policyStatus; }
    public void setPolicyStatus(String policyStatus) { this.policyStatus = policyStatus; }
}
