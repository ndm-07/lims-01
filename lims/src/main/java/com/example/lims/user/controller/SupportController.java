package com.example.lims.user.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportController {

    @GetMapping("/support")
    public String showSupportPage(HttpSession session) {
        // Optional: redirect to login if user is not logged in
        if (session.getAttribute("user") == null) {
            return "redirect:/auth/login";
        }
        return "support"; // this resolves to support.jsp in /WEB-INF/views
    }
}

