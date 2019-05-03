package org.kh.sunbang.chat.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Message implements java.io.Serializable{
	private static final long serialVersionUID = 951013L;
	
	private int message_no;	//채팅글번호
	private String message;	//채팅내용
	private String message_image;	//이미지
	private String origin_filename;	//파일원본명
	private String renew_filename;	//파일수정명
	private Date post_time;	//등록시간
	private int chat_no;	//채팅방번호
	private int user_no;	//회원번호
	
	public Message() {}

	public Message(int message_no, String message, String message_image, String origin_filename, String renew_filename,
			Date post_time, int chat_no, int user_no) {
		super();
		this.message_no = message_no;
		this.message = message;
		this.message_image = message_image;
		this.origin_filename = origin_filename;
		this.renew_filename = renew_filename;
		this.post_time = post_time;
		this.chat_no = chat_no;
		this.user_no = user_no;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage_image() {
		return message_image;
	}

	public void setMessage_image(String message_image) {
		this.message_image = message_image;
	}

	public String getOrigin_filename() {
		return origin_filename;
	}

	public void setOrigin_filename(String origin_filename) {
		this.origin_filename = origin_filename;
	}

	public String getRenew_filename() {
		return renew_filename;
	}

	public void setRenew_filename(String renew_filename) {
		this.renew_filename = renew_filename;
	}

	public Date getPost_time() {
		return post_time;
	}

	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
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
		return "Message [message_no=" + message_no + ", message=" + message + ", message_image=" + message_image
				+ ", origin_filename=" + origin_filename + ", renew_filename=" + renew_filename + ", post_time="
				+ post_time + ", chat_no=" + chat_no + ", user_no=" + user_no + "]";
	}
	
	

}
