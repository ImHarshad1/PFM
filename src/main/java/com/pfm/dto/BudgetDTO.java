package com.pfm.dto;

import com.pfm.entity.Category;

import lombok.Data;

@Data
public class BudgetDTO {

	private Integer month;

	private Integer year;
	
	private Integer catId;
	
	private Double amount;
	
//	private Category category;

}
