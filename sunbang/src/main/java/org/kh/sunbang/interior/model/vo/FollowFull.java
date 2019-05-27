package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class FollowFull implements Serializable {

	private static final long serialVersionUID = 122201L;
	private int follow_no; //팔로우번호
	private int follower_no; //팔로워번호	
	private int user_no; //회원번호
	private String user_profile; //회원프로필
	private String user_id;	//아이디
	private String nickname; //닉네임
	private String user_name;	//성명	
	private int following_count; //팔로잉 수
	private int follow_count; //팔로우 수
	private String keyword;//검색 키워드
	
	public FollowFull() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FollowFull(int follow_no, int follower_no, int user_no, String user_profile, String user_id, String nickname,
			String user_name, int following_count, int follow_count, String keyword) {
		super();
		this.follow_no = follow_no;
		this.follower_no = follower_no;
		this.user_no = user_no;
		this.user_profile = user_profile;
		this.user_id = user_id;
		this.nickname = nickname;
		this.user_name = user_name;
		this.following_count = following_count;
		this.follow_count = follow_count;
		this.keyword = keyword;
	}

	public int getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}

	public int getFollower_no() {
		return follower_no;
	}

	public void setFollower_no(int follower_no) {
		this.follower_no = follower_no;
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

	public int getFollowing_count() {
		return following_count;
	}

	public void setFollowing_count(int following_count) {
		this.following_count = following_count;
	}

	public int getFollow_count() {
		return follow_count;
	}

	public void setFollow_count(int follow_count) {
		this.follow_count = follow_count;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FollowFull [follow_no=" + follow_no + ", follower_no=" + follower_no + ", user_no=" + user_no
				+ ", user_profile=" + user_profile + ", user_id=" + user_id + ", nickname=" + nickname + ", user_name="
				+ user_name + ", following_count=" + following_count + ", follow_count=" + follow_count + ", keyword="
				+ keyword + "]";
	}

	
		
	
}
