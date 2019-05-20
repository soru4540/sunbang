package org.kh.sunbang.user.model.vo;

public class Uboard implements java.io.Serializable{
	private static final long serialVersionUID = 951015L;

	private int board_no; //게시판번호
	private String board_type; //게시판종류
	private String board_title; //제목
	private int like_no; //좋아요 수
	private int board_hits; //조회수
	private int post_no; //게시물번호
	private String post_keyword; //키워드
	private int user_no; //회원번호
	private String post_data; //데이터
	private String user_profile; //회원프로필
	private String nickname; //닉네임
	private int like_count; //좋아요 수
	private int follow_count; //팔로우 수
	public Uboard() {
	}
	public Uboard(int board_no, String board_type, String board_title, int like_no, int board_hits, int post_no,
			String post_keyword, int user_no, String post_data, String user_profile, String nickname, int like_count,
			int follow_count) {
		super();
		this.board_no = board_no;
		this.board_type = board_type;
		this.board_title = board_title;
		this.like_no = like_no;
		this.board_hits = board_hits;
		this.post_no = post_no;
		this.post_keyword = post_keyword;
		this.user_no = user_no;
		this.post_data = post_data;
		this.user_profile = user_profile;
		this.nickname = nickname;
		this.like_count = like_count;
		this.follow_count = follow_count;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getBoard_hits() {
		return board_hits;
	}
	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
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
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getPost_data() {
		return post_data;
	}
	public void setPost_data(String post_data) {
		this.post_data = post_data;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getFollow_count() {
		return follow_count;
	}
	public void setFollow_count(int follow_count) {
		this.follow_count = follow_count;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Uboard [board_no=" + board_no + ", board_type=" + board_type + ", board_title=" + board_title
				+ ", like_no=" + like_no + ", board_hits=" + board_hits + ", post_no=" + post_no + ", post_keyword="
				+ post_keyword + ", user_no=" + user_no + ", post_data=" + post_data + ", user_profile=" + user_profile
				+ ", nickname=" + nickname + ", like_count=" + like_count + ", follow_count=" + follow_count + "]";
	}
	
	
}
