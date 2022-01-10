package com.lcomsurvey.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.lcomsurvey.example.domain.Item;
import com.lcomsurvey.example.domain.Question;
import com.lcomsurvey.example.domain.Survey;

@Mapper
public interface SurveyMapper {
	public void surveyWrite(Survey survey);

	public void questionWrite(Survey survey);
	
	public void items(Question question);
}
