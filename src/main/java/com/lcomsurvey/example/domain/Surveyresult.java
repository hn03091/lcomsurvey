package com.lcomsurvey.example.domain;

import java.util.List;

public class Surveyresult {
	private int s_idx;
	
	private int q_idx;
	private int q_type;
	private String sr_answer;
	
	
	private List<Answer>answers;
	
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
