package com.lcomsurvey.example.domain;

import java.util.List;

public class Surveyresult {
	private int s_idx;
	
	private int q_idx;
	private int q_type;
	private String sr_answer;
	private int i_idx;
	private int sr_idx;
	private int sr2_idx;
	
	
	
	private List<Surveyresult2> surveyresult2s;
	
	
	
	public int getSr2_idx() {
		return sr2_idx;
	}
	public void setSr2_idx(int sr2_idx) {
		this.sr2_idx = sr2_idx;
	}
	public int getSr_idx() {
		return sr_idx;
	}
	public void setSr_idx(int sr_idx) {
		this.sr_idx = sr_idx;
	}
	public int getI_idx() {
		return i_idx;
	}
	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}
	public List<Surveyresult2> getAnswers() {
		return surveyresult2s;
	}
	public void setAnswers(List<Surveyresult2> answers) {
		this.surveyresult2s = answers;
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
