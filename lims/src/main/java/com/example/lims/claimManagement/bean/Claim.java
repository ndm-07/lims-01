package com.example.lims.claimManagement.bean;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "claim")
public class Claim {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int claimId;

    private int policyId;

    private double claimAmount;

    private LocalDate claimDate;

    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('OPEN','APPROVED','REJECTED')")
    private ClaimStatus claimStatus;

    @Column(name = "adjusterId")
    private Integer adjusterId;

    public enum ClaimStatus { OPEN, APPROVED, REJECTED }

    public Claim() {}

    // Getters and Setters
    public int getClaimId() { return claimId; }
    public void setClaimId(int claimId) { this.claimId = claimId; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public double getClaimAmount() { return claimAmount; }
    public void setClaimAmount(double claimAmount) { this.claimAmount = claimAmount; }

    public LocalDate getClaimDate() { return claimDate; }
    public void setClaimDate(LocalDate claimDate) { this.claimDate = claimDate; }

    public ClaimStatus getClaimStatus() { return claimStatus; }
    public void setClaimStatus(ClaimStatus claimStatus) { this.claimStatus = claimStatus; }

    public Integer getAdjusterId() { return adjusterId; }
    public void setAdjusterId(Integer adjusterId) { this.adjusterId = adjusterId; }
}
