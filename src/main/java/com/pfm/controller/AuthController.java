package com.pfm.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pfm.dto.RegisterDTO;
import com.pfm.entity.User;
import com.pfm.repo.UserRepo;
import com.pfm.service.EmailService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AuthController {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private EmailService emailService;

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("register", new RegisterDTO());
		return "register";
	}

	@GetMapping("/login")
	public String loginPage(Model model,@RequestParam(required = false)String error) {
		model.addAttribute("error", error);
		return "login";
	}

	@PostMapping("/register")
	public String registerUser(RegisterDTO register, Model model) throws MessagingException {
		
		Optional<User> opt = userRepo.findByEmail(register.getEmail());
		
		if (opt.isPresent()) {
			model.addAttribute("error", "Already Registered");
			return "login";
		} else {
			User user = new User();
			user.setEmail(register.getEmail());
			user.setName(register.getName());
			user.setPassword(passwordEncoder.encode(register.getPassword()));
			
			userRepo.save(user);

			model.addAttribute("success", "Registered Successfully");
			emailService.sendMailWithTemplate(register.getEmail(), "Welcome to application", register.getName());
			
			return "login";
		}
	}

}
