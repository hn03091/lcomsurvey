package com.lcomsurvey.example.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.test;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Survey;
import com.lcomsurvey.example.domain.User;
import com.lcomsurvey.example.service.SurveyService;
import com.lcomsurvey.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	UserService userservice;
	@Autowired
	SurveyService surveyservice;

	@RequestMapping("/")
	public String home(Model model) {
		logger.debug("debug");
		logger.info("info");
		logger.error("error");

		return "/index";
	}

	@RequestMapping("/surveywrite")
	public String surveywrite(Model model) {

		return "/surveywrite";
	}

/*	@RequestMapping("/surveyprocess")
	@ResponseBody
	public String surveyprocess(Survey survey, Model model) {
		
		surveyservice.surveyWrite(survey);
		surveyservice.questionWrite(survey);
		surveyservice.items(survey);
		return "/surveyprocess";
	}
	*/
/*	@RequestMapping(value = "/surveyprocess", method = RequestMethod.POST)
	@ResponseBody
	public static String readBody(HttpServletRequest request,Model model) throws IOException {
	        BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream()));
	        StringBuilder builder = new StringBuilder();
	        String buffer;
	        while ((buffer = input.readLine()) != null) {
	            if (builder.length() > 0) {
	                builder.append("\n");
	            }
	            builder.append(buffer);
	        }
	        return builder.toString();
	        
	        
	        
	}
*/
	@RequestMapping("/surveyprocess")
	public String surveyprocess(@RequestBody Survey survey){
		
		surveyservice.surveyWrite(survey);
		
		surveyservice.questionWrite(survey);
		for (Question q : survey.getQuestions()) {
			surveyservice.items(q);
			
		}
		
		
		return "/surveyprocess";
	}
	
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}

	@RequestMapping("/signup")
	public String signup(User user) {
		// 비밀번호 암호화
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());

		// 유저 데이터 세팅
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));

		// 유저 생성
		userservice.createUser(user);
		// 유저 권한 생성
		userservice.createAuthorities(user);

		return "/login";
	}

	@RequestMapping(value = "/login")
	public String beforeLogin(Model model) {
		return "/login";
	}

}
