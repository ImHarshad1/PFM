package com.pfm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pfm.dto.BudgetDTO;
import com.pfm.entity.Budget;
import com.pfm.entity.Category;
import com.pfm.entity.User;
import com.pfm.repo.BudgetRepo;
import com.pfm.repo.CategoryRepo;
import com.pfm.repo.UserRepo;

@Controller
public class BudgetController {
	
	@Autowired
	private CategoryRepo categoryRepo;
	
	@Autowired
	private BudgetRepo budgetRepo;
	
	
	@Autowired
	private UserRepo userRepo;
	
	@GetMapping("/budget")
	public String addBudget(Model model) {
		model.addAttribute("bdg", new BudgetDTO());
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		
		// add budgets list 
		List<Budget> budgets = budgetRepo.findAll();
	    model.addAttribute("budgets", budgets);
	    
		return "budget";
	}
	 
	@PostMapping("/budget")
	public String saveBudget(Principal principal, BudgetDTO budgetDTO, Model model) {
		Budget budget = new Budget();
		budget.setMonth(budgetDTO.getMonth());
		budget.setYear(budgetDTO.getYear());
		budget.setAmount(budgetDTO.getAmount());
		
		Category category = categoryRepo.findById(budgetDTO.getCatId())
				.orElseThrow(() -> new RuntimeException("Category not found"));
		budget.setCategory(category);
		
		String email =principal.getName();
		User user = userRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));
		budget.setUser(user);
		
		budgetRepo.save(budget);
		model.addAttribute("successMsg", "Budget saved successfully!");
		model.addAttribute("categories", categoryRepo.findAll());
	    model.addAttribute("budgets", budgetRepo.findAll());
		
		return "budget";
	}
}
