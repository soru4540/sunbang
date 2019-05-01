package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Reply implements Serializable{

	private static final long serialVersionUID = 1225L;
    
	private int reply_no; //댓글번호
	private int reply_lev; //댓글레벨
	private int orgin_reply_no; //원글번호
	private String reply_contents; //내용
	private int user_no; //회원번호
	private int board_no; //게시판번호
	
	public Reply() {
		super();		
	}
	
	public Reply(int reply_no, int reply_lev, int orgin_reply_no, String reply_contents, int user_no, int board_no) {
		super();
		this.reply_no = reply_no;
		this.reply_lev = reply_lev;
		this.orgin_reply_no = orgin_reply_no;
		this.reply_contents = reply_contents;
		this.user_no = user_no;
		this.board_no = board_no;
	}
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getReply_lev() {
		return reply_lev;
	}
	public void setReply_lev(int reply_lev) {
		this.reply_lev = reply_lev;
	}
	public int getOrgin_reply_no() {
		return orgin_reply_no;
	}
	public void setOrgin_reply_no(int orgin_reply_no) {
		this.orgin_reply_no = orgin_reply_no;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
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
		return "Reply [reply_no=" + reply_no + ", reply_lev=" + reply_lev + ", orgin_reply_no=" + orgin_reply_no
				+ ", reply_contents=" + reply_contents + ", user_no=" + user_no + ", board_no=" + board_no + "]";
	}

	
}
