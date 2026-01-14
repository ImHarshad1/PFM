package com.pfm.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pfm.entity.Transaction;

public interface TransactionRepo extends JpaRepository<Transaction, Integer>{

	List<Transaction> findByUserId(Integer uid);
}
