package com.lcomsurvey.example.service;

import java.util.List;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Survey;

public interface SurveyService {
	public void surveyWrite(Survey survey);
	
	public void questionWrite(Survey survey);
	
	public void items(Question question);
	
	public List<Survey> selectSurvey(Survey survey);

	public Survey detailSurvey(Survey survey);
}
