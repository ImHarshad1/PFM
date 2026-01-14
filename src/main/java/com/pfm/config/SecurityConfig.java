package com.pfm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public PasswordEncoder getEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain getFilterChain(HttpSecurity http) {
		
		http.csrf( c->c.disable())
			.authorizeHttpRequests(req -> req
					.requestMatchers("/register","/login",
				            "/forgot-password",
				            "/send-otp",
				            "/verify-otp",
				            "/reset-password")
					.permitAll()
					.requestMatchers("/WEB-INF/**")
					.permitAll()
					.anyRequest()
					.authenticated()
				).formLogin( l -> l
						.loginPage("/login")//GET
						.loginProcessingUrl("/login")//POST
						.defaultSuccessUrl("/dashboard")
						.failureUrl("/login?error=Invalid Credentials"))//GET
				.logout(l -> l
						.logoutUrl("/logout"));
		
		return http.build();
	}
}
