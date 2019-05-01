package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Like implements Serializable{

	private static final long serialVersionUID = 1224L;

	private int like_no; //좋아요번호
	private int user_no; //회원번호
	private int board_no; //게시판번호
	
	public Like() {
		super();
	}
	
	public Like(int like_no, int user_no, int board_no) {
		super();
		this.like_no = like_no;
		this.user_no = user_no;
		this.board_no = board_no;
	}
	
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
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
		return "Like [like_no=" + like_no + ", user_no=" + user_no + ", board_no=" + board_no + "]";
	}
	
    
	
}
