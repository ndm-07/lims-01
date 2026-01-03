package com.example.lims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class LimsApplication extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(LimsApplication.class, args);
	}
}
