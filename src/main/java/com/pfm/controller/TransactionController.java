package com.pfm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pfm.dto.TransactionDTO;
import com.pfm.entity.Category;
import com.pfm.entity.Transaction;
import com.pfm.entity.User;
import com.pfm.repo.CategoryRepo;
import com.pfm.repo.TransactionRepo;
import com.pfm.repo.UserRepo;


@Controller
public class TransactionController {

	@Autowired
	private CategoryRepo categoryRepo;

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private TransactionRepo transactionRepo;

	@GetMapping("/addtransaction")
	public String addtransaction(Model model, @RequestParam(required = false) String msg) {
		if (msg != null)
			model.addAttribute("msg", msg);
		model.addAttribute("txn", new TransactionDTO());
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);
		return "addtransaction";
	}

	@PostMapping("/addtransaction")
	public String postMethodName(Principal principal, TransactionDTO txn) {
		Transaction transaction = new Transaction();
		transaction.setAmount(txn.getAmount());
		transaction.setDescription(txn.getDescription());
		transaction.setDate(txn.getDate());

		Category category = categoryRepo.findById(txn.getCatId())
				.orElseThrow(() -> new RuntimeException("Cat not found"));

		transaction.setType(category.getType());
		transaction.setCategory(category);

		String email = principal.getName();

		User user = userRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));

		transaction.setUser(user);
		transactionRepo.save(transaction);

		return "redirect:/addtransaction?msg=Transaction Added";
	}

	@GetMapping("/transactions")
	public String transactionPage(Principal principal, Model model) {
		String email = principal.getName();
		User user = userRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));

		List<Transaction> txns = transactionRepo.findByUserId(user.getId());

		model.addAttribute("txns", txns);

		return "transactions";
	}

	@GetMapping("/edit")
	public String EditTransactionPage(@RequestParam Integer tid,Model model) {

		Transaction txn = transactionRepo.findById(tid)
				.orElseThrow(() -> new RuntimeException("Transaction not found"));
		
		TransactionDTO dto = new TransactionDTO();
		dto.setId(txn.getId());
		dto.setAmount(txn.getAmount());
		dto.setDescription(txn.getDescription());
		dto.setDate(txn.getDate());
		dto.setCategory(txn.getCategory());
		
		model.addAttribute("dto", dto);
		List<Category> categories = categoryRepo.findAll();
		model.addAttribute("categories", categories);

		return "edittransaction";
	}
	
	@PostMapping("/edittransaction")
	public String EditTransaction(TransactionDTO dto) {
		
		Transaction txn = transactionRepo.findById(dto.getId()).orElseThrow(()-> new RuntimeException("Txn not found"));
		
		txn.setAmount(dto.getAmount());
		txn.setDescription(dto.getDescription());
		txn.setDate(dto.getDate());
		
		Category category = categoryRepo.findById(dto.getCatId()).orElseThrow(()-> new RuntimeException("Txn not found"));
		txn.setCategory(category);
		txn.setType(category.getType());
		
		transactionRepo.save(txn);
		return "redirect:/transactions";
	}
	

}
