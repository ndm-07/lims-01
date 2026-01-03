package com.example.lims.policyManagement.dao;

import com.example.lims.policyManagement.bean.Policy;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PolicyHomeDao extends CrudRepository<Policy, Integer> {
    Optional<Policy> findByPolicyNumber(String policyNumber);
}
