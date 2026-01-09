package com.pfm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pfm.entity.Category;
import com.pfm.repo.CategoryRepo;


@Controller
public class DashboardController {
	
	@Autowired
	private CategoryRepo categoryRepo;

	@GetMapping("/dashboard")
	public String dashboardPage() {
		return "dashboard";
	}
	
	@GetMapping("/category")
	public String CategoryPage(Model model) {
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		return "category";//category.jsp
	}
}
