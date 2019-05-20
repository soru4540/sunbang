package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ReplyFull implements Serializable {

	private static final long serialVersionUID = 122010L;

	private int reply_no; //댓글번호
	private int reply_lev; //댓글레벨
	private int origin_reply_no; //원글번호
	private String reply_contents; //내용	
	private int board_no; //게시판번호
	private int user_no; //회원번호
	private String user_profile; //회원프로필
	private String user_id;	//아이디
	private String nickname; //닉네임
	private String user_name;	//성명	
	
	public ReplyFull() {}

	public ReplyFull(int reply_no, int reply_lev, int origin_reply_no, String reply_contents, int board_no, int user_no,
			String user_profile, String user_id, String nickname, String user_name) {
		super();
		this.reply_no = reply_no;
		this.reply_lev = reply_lev;
		this.origin_reply_no = origin_reply_no;
		this.reply_contents = reply_contents;
		this.board_no = board_no;
		this.user_no = user_no;
		this.user_profile = user_profile;
		this.user_id = user_id;
		this.nickname = nickname;
		this.user_name = user_name;
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

	public int getOrigin_reply_no() {
		return origin_reply_no;
	}

	public void setOrigin_reply_no(int origin_reply_no) {
		this.origin_reply_no = origin_reply_no;
	}

	public String getReply_contents() {
		return reply_contents;
	}

	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReplyFull [reply_no=" + reply_no + ", reply_lev=" + reply_lev + ", origin_reply_no=" + origin_reply_no
				+ ", reply_contents=" + reply_contents + ", board_no=" + board_no + ", user_no=" + user_no
				+ ", user_profile=" + user_profile + ", user_id=" + user_id + ", nickname=" + nickname + ", user_name="
				+ user_name + "]";
	}		
	
	
	
	
}
