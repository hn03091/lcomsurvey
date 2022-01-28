package com.lcomsurvey.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Result;

import com.lcomsurvey.example.domain.Survey;
import com.lcomsurvey.example.domain.Surveyresult;
import com.lcomsurvey.example.domain.Surveyresult2;
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
	public List<Survey> getresult(Survey survey){
		return surveymapper.getresult(survey);
	}
	public List<Survey> getresult2(Survey survey){
		return surveymapper.getresult2(survey);
	}
	public List<Item> getitem(Item item){
		return surveymapper.getitem(item);
	}
	public Survey getsurvey(Survey survey) {
		return surveymapper.getsurvey(survey);
	}
	
	public List<Surveyresult2> itemcount(Surveyresult2 surveyresult2){
		return surveymapper.itemcount(surveyresult2);
	}
	

	
	/*
	public List<Result> getresult1(List<Result> result) {
		return surveymapper.getresult1(result);
	}
	public Result getresult2(List<Result> result) {
		return surveymapper.getresult2(result);
	}*/
	
}
