package com.example.lims.beneficiaryManagement.dao;

import com.example.lims.beneficiaryManagement.bean.Beneficiary;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BeneficiaryRepository extends CrudRepository<Beneficiary, Integer> {
    // CRUD methods like save(), findAll(), deleteById() already included
}
