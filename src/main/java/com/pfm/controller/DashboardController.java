package com.pfm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pfm.entity.Category;
import com.pfm.entity.User;
import com.pfm.repo.CategoryRepo;
import com.pfm.repo.UserRepo;

import jakarta.servlet.http.HttpSession;


@Controller
public class DashboardController {
	
	@Autowired
	private CategoryRepo categoryRepo;

	@Autowired
    private UserRepo userRepo;
	
	@GetMapping("/dashboard")
    public String dashboard(HttpSession session, Principal principal) {
        String email = principal.getName();
        User user = userRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));
        if (user != null) {
            session.setAttribute("userName", user.getName());
        }
        return "dashboard";
    }
	
	@GetMapping("/category")
	public String CategoryPage(Model model) {
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		return "category";
	}
}
