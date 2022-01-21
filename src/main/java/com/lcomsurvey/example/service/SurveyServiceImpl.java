package com.lcomsurvey.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Survey;
import com.lcomsurvey.example.domain.Surveyresult;
import com.lcomsurvey.example.mapper.SurveyMapper;


@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired SurveyMapper surveymapper;
	
	@Override
	public void surveyWrite(Survey survey) {
		surveymapper.surveyWrite(survey);
	}
	public void questionWrite(Survey survey) {
		surveymapper.questionWrite(survey);
	}
	public void items(Question question) {
		surveymapper.items(question);
	}
	public List<Survey> selectSurvey(Survey survey){
		return surveymapper.selectSurvey(survey);
	}
	public Survey detailSurvey(Survey survey) {
		return surveymapper.detailSurvey(survey);
	}
	public void result(List<Surveyresult> surveyresult) {
		surveymapper.result(surveyresult);
	}
	public void result2(List<Surveyresult> surveyresult) {
		surveymapper.result2(surveyresult);
	}

}
