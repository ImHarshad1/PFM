package com.pfm.service;

import jakarta.mail.MessagingException;

public interface EmailService {
	public void sendMailWithTemplate(String toEmail,String subject, String username) throws MessagingException;
}
