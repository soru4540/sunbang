package org.kh.sunbang.chat.model.vo;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Chat implements java.io.Serializable{
	private static final long serialVersionUID = 951012L;
	
	private int chat_no;	//채팅방번호
	private int user_no;	//회원번호
	private String chat_name;	//채팅방제목
	private String chat_type;	//채팅방분류
	private String alert_status;	//알람상태
	private String join_time;	//입장시간
	private String away_time;	//퇴장시간
	private String check_join;	//입장여부
	private int realty_no;	//매물번호
	private String nickname; //닉네임
	private String user_profile; //프로필
	
	public Chat() {}

	public Chat(int chat_no, int user_no, String chat_name, String chat_type, String alert_status, String join_time,
			String away_time, String check_join, int realty_no) {
		super();
		this.chat_no = chat_no;
		this.user_no = user_no;
		this.chat_name = chat_name;
		this.chat_type = chat_type;
		this.alert_status = alert_status;
		this.join_time = join_time;
		this.away_time = away_time;
		this.check_join = check_join;
		this.realty_no = realty_no;
	}

	public Chat(int chat_no, int user_no, String nickname, String user_profile) {
		super();
		this.chat_no = chat_no;
		this.user_no = user_no;
		this.nickname = nickname;
		this.user_profile = user_profile;
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

	public String getChat_name() {
		return chat_name;
	}

	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}

	public String getChat_type() {
		return chat_type;
	}

	public void setChat_type(String chat_type) {
		this.chat_type = chat_type;
	}

	public String getAlert_status() {
		return alert_status;
	}

	public void setAlert_status(String alert_status) {
		this.alert_status = alert_status;
	}

	public String getJoin_time() {
		return join_time;
	}

	public void setJoin_time(String join_time) {
		this.join_time = join_time;
	}

	public String getAway_time() {
		return away_time;
	}

	public void setAway_time(String away_time) {
		this.away_time = away_time;
	}

	public String getCheck_join() {
		return check_join;
	}

	public void setCheck_join(String check_join) {
		this.check_join = check_join;
	}

	public int getRealty_no() {
		return realty_no;
	}

	public void setRealty_no(int realty_no) {
		this.realty_no = realty_no;
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
		return "Chat [chat_no=" + chat_no + ", user_no=" + user_no + ", chat_name=" + chat_name + ", chat_type="
				+ chat_type + ", alert_status=" + alert_status + ", join_time=" + join_time + ", away_time=" + away_time
				+ ", check_join=" + check_join + ", realty_no=" + realty_no + ", nickname=" + nickname
				+ ", user_profile=" + user_profile + "]";
	}

	
	
}
