package com.lcomsurvey.example.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

import com.lcomsurvey.example.domain.Answer;
import com.lcomsurvey.example.domain.Item;

import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Surveyresult;
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
	public String home(Model model, Survey survey) {
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		List<Survey> list =surveyservice.selectSurvey(survey);
		model.addAttribute("list", list);

		return "/index";
	}
	@RequestMapping("/detailsurvey")
	public String detailsurvey(Model model, Survey survey) {
		survey = surveyservice.detailSurvey(survey);
		model.addAttribute("survey", survey);
		
		return "/detailsurvey";
	}
	@RequestMapping("/result")
	public String result(Model model, Survey survey) {
		survey =surveyservice.detailSurvey(survey);
		model.addAttribute("survey", survey);
		
		return "/result";
	}

	@RequestMapping("/surveywrite")
	public String surveywrite(Model model) {

		return "/surveywrite";
	}

	@RequestMapping("/resultprocess")
	public String resultprocess(@RequestBody List<Surveyresult> surveyresult) {
		
		/*List<Surveyresult> answer2 = new ArrayList<Surveyresult>();
		for(Surveyresult rs : surveyresult) {
			int qtype= rs.getQ_type();
			if(qtype <3) {				
		//		surveyservice.result(rs);
			}else if(qtype ==3){
				
				
			}
		}*/
		List<Surveyresult> s2 = surveyresult.stream().
				filter(rs -> rs.getQ_type() == 3)
				.collect(Collectors.toList());
		
		List<Surveyresult> s = surveyresult.stream().
				filter(rs -> rs.getQ_type() < 3)
				.collect(Collectors.toList());
		surveyservice.result(s);
		//surveyservice.result2(s2);
		
		return "/resultprocess";
	}
	@RequestMapping("/surveyprocess")
	public String surveyprocess(@RequestBody Survey survey,Item item,Question question){
		int sIdx;
		int qIdx= 1;
		surveyservice.surveyWrite(survey);
		
		surveyservice.questionWrite(survey);
		sIdx= survey.getS_idx();
		
		for (Question q : survey.getQuestions()) {
			
			q.setQ_idx(qIdx);
			q.setS_idx(sIdx);
			qIdx +=1;
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
