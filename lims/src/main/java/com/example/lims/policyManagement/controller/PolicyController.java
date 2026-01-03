package com.example.lims.policyManagement.controller;

import com.example.lims.policyManagement.bean.Policy;
import com.example.lims.policyManagement.service.PolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/policy")
public class PolicyController {

    @Autowired
    private PolicyService policyService;

    // Home page
    @GetMapping("/home")
    public String showPolicyHome() {
        return "policy-home"; // policy-home.jsp
    }

    // Show form to add a new policy
    @GetMapping("/add")
    public String showAddPolicyForm(Model model) {
        model.addAttribute("policy", new Policy());
        return "policy-add"; // renamed JSP file
    }

    // Save new policy
    @PostMapping("/save")
    public String savePolicy(@ModelAttribute("policy") Policy policy) {
        policyService.savePolicy(policy);
        return "redirect:/policy/all";
    }

    // Show all policies
    @GetMapping("/all")
    public ModelAndView getAllPolicies() {
        List<Policy> list = policyService.getAllPolicies();
        ModelAndView mav = new ModelAndView("policy-list"); // policy-list.jsp
        mav.addObject("policies", list);
        return mav;
    }

    // View policy by policy number
    @GetMapping("/view-by-number")
    public ModelAndView viewPolicyByNumber(@RequestParam("policyNumber") String policyNumber) {
        ModelAndView mav = new ModelAndView("policy-details"); // policy-details.jsp
        Optional<Policy> policy = policyService.getPolicyByNumber(policyNumber);
        if (policy.isPresent()) {
            mav.addObject("policy", policy.get());
        } else {
            mav.setViewName("policy-home");
            mav.addObject("error", "Policy " + policyNumber + " not found!");
        }
        return mav;
    }

    // Show list of policies for update
    @GetMapping("/updateform")
    public ModelAndView showUpdateList() {
        List<Policy> list = policyService.getAllPolicies();
        ModelAndView mav = new ModelAndView("policy-update-form"); // policy-update-form.jsp
        mav.addObject("policies", list);
        return mav;
    }

    // Show edit form for a specific policy
    @GetMapping("/edit/{num}")
    public ModelAndView showEditForm(@PathVariable("num") String num) {
        ModelAndView mav = new ModelAndView("policy-update"); // policy-update.jsp
        Optional<Policy> policy = policyService.getPolicyByNumber(num);
        policy.ifPresentOrElse(
                p -> mav.addObject("policy", p),
                () -> mav.setViewName("redirect:/policy/updateform")
        );
        return mav;
    }

    // Update policy
    @PostMapping("/update")
    public String updatePolicy(@ModelAttribute("policy") Policy policy) {
        policyService.savePolicy(policy);
        return "redirect:/policy/home";
    }

    // Delete policy
    @PostMapping("/execute-delete")
    public String executeDelete(@RequestParam("policyNumber") String policyNumber) {
        boolean isDeleted = policyService.deleteByPolicyNumber(policyNumber);
        return isDeleted ? "redirect:/policy/all" : "redirect:/policy/home?error=PolicyNotFound";
    }
}
