package com.pfm.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class TransactionDTO {

	private Double amount;

	private String description;

	private LocalDate date;

	private Integer catId;
}
