package com.pfm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.pfm.service.EmailService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender javaMailSender;

	
	public void sendMailWithTemplate(String toEmail,String subject, String username) throws MessagingException {
		
		    String htmlContent = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <style>
                    body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }
                    .container { background: white; padding: 20px; border-radius: 10px; }
                    h1 { color: #4CAF50; }
                    p { font-size: 16px; }
                    .footer { margin-top: 20px; font-size: 12px; color: gray; }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Welcome, username</h1>
                    <p>Thank you for registering in our Personal Finance Management System.</p>
                    <p>We are excited to have you on board.</p>
                    <div class="footer">
                        &copy; 2026 Personal Finance Management System
                    </div>
                </div>
            </body>
            </html>
            """;

        
        htmlContent = String.format(htmlContent, username);

      
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(toEmail);
        helper.setSubject(subject);
        helper.setText(htmlContent, true); 
        javaMailSender.send(message);
        System.out.println("Email sent successfully to " + toEmail);
    }
}
