package com.example.lims.paymentManagement.dao;

import com.example.lims.paymentManagement.bean.Payment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentRepository extends CrudRepository<Payment, Integer> {
    List<Payment> findByPolicyId(int policyId);
}
