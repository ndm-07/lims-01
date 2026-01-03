package com.example.lims.claimManagement.dao;

import com.example.lims.claimManagement.bean.Claim;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClaimRepository extends CrudRepository<Claim, Integer> {
    List<Claim> findByPolicyId(int policyId);
}

