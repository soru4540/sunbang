package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Follow implements Serializable{

	private static final long serialVersionUID = 1226L;

	private int follow_no; //팔로우번호
	private int follower_no; //팔로워번호
	private int user_no; //회원번호
	
	public Follow() {
		super();
	}
	
	public Follow(int follow_no, int follower_no, int user_no) {
		super();
		this.follow_no = follow_no;
		this.follower_no = follower_no;
		this.user_no = user_no;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Follow [follow_no=" + follow_no + ", follower_no=" + follower_no + ", user_no=" + user_no + "]";
	}

    	

}
