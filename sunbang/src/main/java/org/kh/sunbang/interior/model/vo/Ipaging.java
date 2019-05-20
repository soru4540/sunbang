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
	private String keyword1; //키워드1
	private String keyword2; //키워드2
	private String keyword3; //키워드3
	private String keyword4; //키워드4
	private String keyword5; //키워드5
	private String keyword6; //키워드6
	private String keyword7; //키워드7
	
	public Ipaging() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ipaging(int page, int start_num, int end_num, String board_type, int user_no, String keyword1,
			String keyword2, String keyword3, String keyword4, String keyword5, String keyword6, String keyword7) {
		super();
		this.page = page;
		this.start_num = start_num;
		this.end_num = end_num;
		this.board_type = board_type;
		this.user_no = user_no;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.keyword4 = keyword4;
		this.keyword5 = keyword5;
		this.keyword6 = keyword6;
		this.keyword7 = keyword7;
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

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getKeyword3() {
		return keyword3;
	}

	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}

	public String getKeyword4() {
		return keyword4;
	}

	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}

	public String getKeyword5() {
		return keyword5;
	}

	public void setKeyword5(String keyword5) {
		this.keyword5 = keyword5;
	}

	public String getKeyword6() {
		return keyword6;
	}

	public void setKeyword6(String keyword6) {
		this.keyword6 = keyword6;
	}

	public String getKeyword7() {
		return keyword7;
	}

	public void setKeyword7(String keyword7) {
		this.keyword7 = keyword7;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Ipaging [page=" + page + ", start_num=" + start_num + ", end_num=" + end_num + ", board_type="
				+ board_type + ", user_no=" + user_no + ", keyword1=" + keyword1 + ", keyword2=" + keyword2
				+ ", keyword3=" + keyword3 + ", keyword4=" + keyword4 + ", keyword5=" + keyword5 + ", keyword6="
				+ keyword6 + ", keyword7=" + keyword7 + "]";
	}
	
	
}
