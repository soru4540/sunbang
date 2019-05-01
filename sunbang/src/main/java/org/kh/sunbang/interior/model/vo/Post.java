package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Post implements Serializable{

	private static final long serialVersionUID = 1222L;

	private int post_no; //게시물번호
	private String post_keyword; //키워드
	private String post_data; //데이터
	private String post_contents; //텍스트
	private int board_no; //게시판번호
	
	public Post() {
		super();	
	}
	    
	public Post(int post_no, String post_keyword, String post_data, String post_contents, int board_no) {
		super();
		this.post_no = post_no;
		this.post_keyword = post_keyword;
		this.post_data = post_data;
		this.post_contents = post_contents;
		this.board_no = board_no;
	}
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPost_keyword() {
		return post_keyword;
	}
	public void setPost_keyword(String post_keyword) {
		this.post_keyword = post_keyword;
	}
	public String getPost_data() {
		return post_data;
	}
	public void setPost_data(String post_data) {
		this.post_data = post_data;
	}
	public String getPost_contents() {
		return post_contents;
	}
	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Post [post_no=" + post_no + ", post_keyword=" + post_keyword + ", post_data=" + post_data
				+ ", post_contents=" + post_contents + ", board_no=" + board_no + "]";
	}
	
	
}
