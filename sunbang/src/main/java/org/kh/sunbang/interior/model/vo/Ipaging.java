package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Ipaging implements Serializable{

	private static final long serialVersionUID = 1229L;
		
	private int page; //페이지 
	private int start_num; //rownum 시작번호
	private int end_num; //rownum 끝번호
	private String board_type; //게시판종류
	private int user_no; //회원번호
	
	public Ipaging() {	
	}
	
	public Ipaging(int page, int start_num, int end_num, String board_type, int user_no) {
		super();
		this.page = page;
		this.start_num = start_num;
		this.end_num = end_num;
		this.board_type = board_type;
		this.user_no = user_no;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStart_num() {
		return start_num;
	}
	public void setStart_num(int start_num) {
		this.start_num = start_num;
	}
	public int getEnd_num() {
		return end_num;
	}
	public void setEnd_num(int end_num) {
		this.end_num = end_num;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Ipaging [page=" + page + ", start_num=" + start_num + ", end_num=" + end_num + ", board_type="
				+ board_type + ", user_no=" + user_no + "]";
	}	
	

}
