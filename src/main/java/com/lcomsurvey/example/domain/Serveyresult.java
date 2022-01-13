package com.lcomsurvey.example.domain;

public class Serveyresult {
	private int s_idx;
	private int sr_idx;
	private int q_idx;
	private int q_type;
	private String result;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

}
