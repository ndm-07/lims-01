package com.example.lims.paymentManagement.controller;

import com.example.lims.paymentManagement.bean.Payment;
import com.example.lims.paymentManagement.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    // Load payment home page
    @GetMapping("/home")
    public String showPaymentHome(Model model) {
        model.addAttribute("payments", paymentService.getAllPayments());
        model.addAttribute("newPayment", new Payment());
        return "payment-home";
    }

    // Make a new payment
    @PostMapping("/makePayment")
    public String makePayment(@ModelAttribute("newPayment") Payment payment) {
        paymentService.processMakePayment(payment);
        return "redirect:/payment/home";
    }

    // Filter payments by policy
    @GetMapping("/filter")
    public String getPaymentsByPolicy(@RequestParam("policyId") int policyId, Model model) {
        List<Payment> filtered = paymentService.getPaymentsByPolicy(policyId);
        model.addAttribute("payments", filtered);
        model.addAttribute("newPayment", new Payment());
        return "payment-home";
    }
}
