package com.example.lims.paymentManagement.service;

import com.example.lims.paymentManagement.bean.Payment;
import com.example.lims.paymentManagement.dao.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository repository;

    // Get all payments
    public List<Payment> getAllPayments() {
        return (List<Payment>) repository.findAll();
    }

    // Get payments by policy ID
    public List<Payment> getPaymentsByPolicy(int policyId) {
        return repository.findByPolicyId(policyId);
    }

    // Process new payment
    public Payment processMakePayment(Payment payment) {
        payment.setPaymentDate(LocalDate.now());

        // MOCK payment gateway logic
        double chance = Math.random();
        if (chance > 0.1) {
            payment.setPaymentStatus("SUCCESS");
        } else {
            payment.setPaymentStatus("FAILED");
        }

        return repository.save(payment);
    }
}
