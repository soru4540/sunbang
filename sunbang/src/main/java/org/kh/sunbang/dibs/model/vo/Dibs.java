package org.kh.sunbang.dibs.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Dibs {
	private static final long serialVersionUID = 930206L;
	
	public Dibs() {}
	
	private int dibs_no;	//찜번호
	private String memo;	//메모
	private int user_no;	//회원번호
	private int	realty_no;	//매물번호

	public Dibs(int dibs_no, String memo, int user_no, int realty_no) {
		super();
		this.dibs_no = dibs_no;
		this.memo = memo;
		this.user_no = user_no;
		this.realty_no = realty_no;
	}

	public int getDibs_no() {
		return dibs_no;
	}

	public void setDibs_no(int dibs_no) {
		this.dibs_no = dibs_no;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getRealty_no() {
		return realty_no;
	}

	public void setRealty_no(int realty_no) {
		this.realty_no = realty_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Dibs [dibs_no=" + dibs_no + ", memo=" + memo + ", user_no=" + user_no + ", realty_no=" + realty_no
				+ "]";
	}
	
}
