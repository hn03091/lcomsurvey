package com.lcomsurvey.example.domain;

import java.util.List;

public class Surveyresult {
	private int s_idx;
	private int sr_idx;
	private int q_idx;
	private int q_type;
	private String sr_answer;
	//private String sr_answer2;
	
	private List<Answer>answers;
	//private List<Surveyresult> Surveyresults;

	/*public List<Surveyresult> getSurveyresults() {
		return Surveyresults;
	}
	public void setSurveyresults(List<Surveyresult> surveyresults) {
		Surveyresults = surveyresults;
	}*/
	
	
	/*public String getSr_answer2() {
		return sr_answer2;
	}
	public void setSr_answer2(String sr_answer2) {
		this.sr_answer2 = sr_answer2;
	}*/
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	public String getSr_answer() {
		return sr_answer;
	}
	public void setSr_answer(String sr_answer) {
		this.sr_answer = sr_answer;
	}
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getSr_idx() {
		return sr_idx;
	}
	public void setSr_idx(int sr_idx) {
		this.sr_idx = sr_idx;
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public int getQ_type() {
		return q_type;
	}
	public void setQ_type(int q_type) {
		this.q_type = q_type;
	}

	

}
