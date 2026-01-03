package com.example.lims.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingController {

    @GetMapping({"/", "/landingPage"})
    public String showLandingPage() {
        return "landingPage";
    }
}
