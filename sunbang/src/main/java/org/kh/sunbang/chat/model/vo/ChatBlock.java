package org.kh.sunbang.chat.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ChatBlock implements java.io.Serializable{
	private static final long serialVersionUID = 951014L;

	private int block_no;	//채팅차단번호
	private int block_user;	//차단회원번호
	private String block_time;	//차단시간
	private int user_no;	//회원번호
	private String nickname;	//닉네임
	private String user_profile; //프로필사진
	
	public ChatBlock() {}

	public ChatBlock(int block_no, int block_user, String block_time, int user_no, String nickname,
			String user_profile) {
		super();
		this.block_no = block_no;
		this.block_user = block_user;
		this.block_time = block_time;
		this.user_no = user_no;
		this.nickname = nickname;
		this.user_profile = user_profile;
	}

	public int getBlock_no() {
		return block_no;
	}

	public void setBlock_no(int block_no) {
		this.block_no = block_no;
	}

	public int getBlock_user() {
		return block_user;
	}

	public void setBlock_user(int block_user) {
		this.block_user = block_user;
	}

	public String getBlock_time() {
		return block_time;
	}

	public void setBlock_time(String block_time) {
		this.block_time = block_time;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ChatBlock [block_no=" + block_no + ", block_user=" + block_user + ", block_time=" + block_time
				+ ", user_no=" + user_no + ", nickname=" + nickname + ", user_profile=" + user_profile + "]";
	}
	
	
	
}
