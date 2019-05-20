package org.kh.sunbang.user.model.vo;

import java.sql.Date;

public class Urealty implements java.io.Serializable{
	private static final long serialVersionUID = 951016L;
	
	private int dibs_no;	//찜번호
	private String memo;	//메모
	private int	realty_no;					//매물번호
	private String move_available_date;		//입주가능일
	private int realty_hits;				//조회수
	private String realty_type;				//매물종류
	private String road_address;			//도로명주소
	private long month_lease;				//월세
	private long payback_deposit_lease;		//전세
	private long residential;				//공급면적
	private String realty_image1;			//일반사진1
	private String nickname;					//닉네임
	private int user_no;					//회원번호
	private int user_profile;					//프로필
	private int dibs_count;					//찜횟수
	private String realty_detail_title;		//상세정보제목
	
	public Urealty() {
	}

	public Urealty(int dibs_no, String memo, int realty_no, String move_available_date, int realty_hits,
			String realty_type, String road_address, long month_lease, long payback_deposit_lease, long residential,
			String realty_image1, String nickname, int user_no, int user_profile, int dibs_count,
			String realty_detail_title) {
		super();
		this.dibs_no = dibs_no;
		this.memo = memo;
		this.realty_no = realty_no;
		this.move_available_date = move_available_date;
		this.realty_hits = realty_hits;
		this.realty_type = realty_type;
		this.road_address = road_address;
		this.month_lease = month_lease;
		this.payback_deposit_lease = payback_deposit_lease;
		this.residential = residential;
		this.realty_image1 = realty_image1;
		this.nickname = nickname;
		this.user_no = user_no;
		this.user_profile = user_profile;
		this.dibs_count = dibs_count;
		this.realty_detail_title = realty_detail_title;
	}

	public int getDibs_no() {
		return dibs_no;
	}

	public void setDibs_no(int dibs_no) {
		this.dibs_no = dibs_no;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getRealty_no() {
		return realty_no;
	}

	public void setRealty_no(int realty_no) {
		this.realty_no = realty_no;
	}

	public String getMove_available_date() {
		return move_available_date;
	}

	public void setMove_available_date(String move_available_date) {
		this.move_available_date = move_available_date;
	}

	public int getRealty_hits() {
		return realty_hits;
	}

	public void setRealty_hits(int realty_hits) {
		this.realty_hits = realty_hits;
	}

	public String getRealty_type() {
		return realty_type;
	}

	public void setRealty_type(String realty_type) {
		this.realty_type = realty_type;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public long getMonth_lease() {
		return month_lease;
	}

	public void setMonth_lease(long month_lease) {
		this.month_lease = month_lease;
	}

	public long getPayback_deposit_lease() {
		return payback_deposit_lease;
	}

	public void setPayback_deposit_lease(long payback_deposit_lease) {
		this.payback_deposit_lease = payback_deposit_lease;
	}

	public long getResidential() {
		return residential;
	}

	public void setResidential(long residential) {
		this.residential = residential;
	}

	public String getRealty_image1() {
		return realty_image1;
	}

	public void setRealty_image1(String realty_image1) {
		this.realty_image1 = realty_image1;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(int user_profile) {
		this.user_profile = user_profile;
	}

	public int getDibs_count() {
		return dibs_count;
	}

	public void setDibs_count(int dibs_count) {
		this.dibs_count = dibs_count;
	}

	public String getRealty_detail_title() {
		return realty_detail_title;
	}

	public void setRealty_detail_title(String realty_detail_title) {
		this.realty_detail_title = realty_detail_title;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Urealty [dibs_no=" + dibs_no + ", memo=" + memo + ", realty_no=" + realty_no + ", move_available_date="
				+ move_available_date + ", realty_hits=" + realty_hits + ", realty_type=" + realty_type
				+ ", road_address=" + road_address + ", month_lease=" + month_lease + ", payback_deposit_lease="
				+ payback_deposit_lease + ", residential=" + residential + ", realty_image1=" + realty_image1
				+ ", nickname=" + nickname + ", user_no=" + user_no + ", user_profile=" + user_profile + ", dibs_count="
				+ dibs_count + ", realty_detail_title=" + realty_detail_title + "]";
	}


	
	
	
	
}
