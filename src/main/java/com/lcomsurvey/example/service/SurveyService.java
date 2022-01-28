package com.lcomsurvey.example.service;

import java.util.List;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Result;

import com.lcomsurvey.example.domain.Survey;
import com.lcomsurvey.example.domain.Surveyresult;
import com.lcomsurvey.example.domain.Surveyresult2;

public interface SurveyService {
	public void surveyWrite(Survey survey);
	
	public void questionWrite(Survey survey);
	
	public void items(Question question);
	
	public List<Survey> selectSurvey(Survey survey);

	public Survey detailSurvey(Survey survey);
	
	public void result(List<Surveyresult> surveyresult);
	
	public void result2(List<Surveyresult> surveyresult);
	
	public List<Survey> getresult(Survey survey);
	
	public List<Survey> getresult2(Survey survey);
	
	public List<Item> getitem(Item item);
	
	public Survey getsurvey(Survey survey);
	
	public List<Surveyresult2> itemcount(Surveyresult2 surveyresult2);
	/*
	public List<Result> getresult1(List<Result> result);
	
	public Result getresult2(List<Result> result);
	*/
	
}
