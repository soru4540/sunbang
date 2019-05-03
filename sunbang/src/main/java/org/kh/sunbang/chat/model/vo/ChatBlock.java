package org.kh.sunbang.chat.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ChatBlock implements java.io.Serializable{
	private static final long serialVersionUID = 951014L;

	private int block_no;	//채팅차단번호
	private int block_user;	//차단회원번호
	private Date block_time;	//차단시간
	private int user_no;	//회원번호
	
	public ChatBlock() {}
	
	public ChatBlock(int block_no, int block_user, Date block_time, int user_no) {
		super();
		this.block_no = block_no;
		this.block_user = block_user;
		this.block_time = block_time;
		this.user_no = user_no;
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
	public Date getBlock_time() {
		return block_time;
	}
	public void setBlock_time(Date block_time) {
		this.block_time = block_time;
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
		return "ChatBlock [block_no=" + block_no + ", block_user=" + block_user + ", block_time=" + block_time
				+ ", user_no=" + user_no + "]";
	}
	
	
}
