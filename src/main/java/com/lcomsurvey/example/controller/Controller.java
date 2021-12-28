package com.lcomsurvey.example.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lcomsurvey.example.domain.User;
import com.lcomsurvey.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired UserService userservice;

	
	@RequestMapping("/")
	public String home(Model model) {
		
		
		return "/index";
	}
	@RequestMapping("/surveywrite")
	public String surveywrite(Model model) {
		
		
		return "/surveywrite";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	   public String signup(User user) {
	      //비밀번호 암호화
	      String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	      
	      //유저 데이터 세팅
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));   
	      
	      //유저 생성
	      userservice.createUser(user);
	      //유저 권한 생성
	      userservice.createAuthorities(user);
	      
	      return "/login";
	   }
	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}

}
