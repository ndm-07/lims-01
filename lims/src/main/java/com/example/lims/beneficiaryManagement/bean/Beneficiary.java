package com.example.lims.beneficiaryManagement.bean;

import jakarta.persistence.*;

@Entity
@Table(name = "beneficiary") // Ensure matches your MySQL table name
public class Beneficiary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int beneficiaryId;

    @Column(nullable = false)
    private int policyId;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, length = 50)
    private String relationship;

    @Column(nullable = false)
    private double percentageShare;

    public Beneficiary() {}

    // Getters and Setters
    public int getBeneficiaryId() { return beneficiaryId; }
    public void setBeneficiaryId(int beneficiaryId) { this.beneficiaryId = beneficiaryId; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getRelationship() { return relationship; }
    public void setRelationship(String relationship) { this.relationship = relationship; }

    public double getPercentageShare() { return percentageShare; }
    public void setPercentageShare(double percentageShare) { this.percentageShare = percentageShare; }
}
