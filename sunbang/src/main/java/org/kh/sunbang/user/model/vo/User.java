package org.kh.sunbang.user.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class User implements java.io.Serializable{
	private static final long serialVersionUID = 951010L;

	private int user_no;		//회원번호
	private String user_type;		//회원분류
	private String user_profile;	//회원분류
	private String user_id;			//아이디
	private String nickname;		//닉네임
	private String user_name;	//성명
	private String email;			//이메일
	private String phone;			//전화번호
	private String password;		//비밀번호
	private String join_date;		//가입일
	private String update_date;	//수정일
	private int user_status;		//회원등급
	private String reason_leave;	//탈퇴사유
	private int login_num;		//로그인시도횟수
	private int business_user_no;	//기업회원번호
	private String office_name;	//중개사무소명
	private String office_regist_no;	//중개등록번호
	private String business_license_no;	//사업자등록번호
	private String office_address;	//중개사무소주소
	private String office_phone;		//대표전화번호
	private String status_agreement;	//가입승인상태
	private String premium_status;	//프리미엄여부

	public User() {}

	public User(int user_no, String user_type, String user_profile, String user_id, String nickname, String user_name,
			String email, String phone, String password, String join_date, String update_date, int user_status,
			String reason_leave, int login_num, int business_user_no, String office_name, String office_regist_no,
			String business_license_no, String office_address, String office_phone, String status_agreement,
			String premium_status) {
		super();
		this.user_no = user_no;
		this.user_type = user_type;
		this.user_profile = user_profile;
		this.user_id = user_id;
		this.nickname = nickname;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.join_date = join_date;
		this.update_date = update_date;
		this.user_status = user_status;
		this.reason_leave = reason_leave;
		this.login_num = login_num;
		this.business_user_no = business_user_no;
		this.office_name = office_name;
		this.office_regist_no = office_regist_no;
		this.business_license_no = business_license_no;
		this.office_address = office_address;
		this.office_phone = office_phone;
		this.status_agreement = status_agreement;
		this.premium_status = premium_status;
	}

	public User(int user_no, String user_type, String user_profile, String user_id, String nickname, String user_name,
			String email, String phone, String password, String join_date, String update_date, int user_status,
			String reason_leave, int login_num) {
		super();
		this.user_no = user_no;
		this.user_type = user_type;
		this.user_profile = user_profile;
		this.user_id = user_id;
		this.nickname = nickname;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.join_date = join_date;
		this.update_date = update_date;
		this.user_status = user_status;
		this.reason_leave = reason_leave;
		this.login_num = login_num;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public String getReason_leave() {
		return reason_leave;
	}

	public void setReason_leave(String reason_leave) {
		this.reason_leave = reason_leave;
	}

	public int getLogin_num() {
		return login_num;
	}

	public void setLogin_num(int login_num) {
		this.login_num = login_num;
	}

	public int getBusiness_user_no() {
		return business_user_no;
	}

	public void setBusiness_user_no(int business_user_no) {
		this.business_user_no = business_user_no;
	}

	public String getOffice_name() {
		return office_name;
	}

	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}

	public String getOffice_regist_no() {
		return office_regist_no;
	}

	public void setOffice_regist_no(String office_regist_no) {
		this.office_regist_no = office_regist_no;
	}

	public String getBusiness_license_no() {
		return business_license_no;
	}

	public void setBusiness_license_no(String business_license_no) {
		this.business_license_no = business_license_no;
	}

	public String getOffice_address() {
		return office_address;
	}

	public void setOffice_address(String office_address) {
		this.office_address = office_address;
	}

	public String getOffice_phone() {
		return office_phone;
	}

	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}

	public String getStatus_agreement() {
		return status_agreement;
	}

	public void setStatus_agreement(String status_agreement) {
		this.status_agreement = status_agreement;
	}

	public String getPremium_status() {
		return premium_status;
	}

	public void setPremium_status(String premium_status) {
		this.premium_status = premium_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_type=" + user_type + ", user_profile=" + user_profile + ", user_id="
				+ user_id + ", nickname=" + nickname + ", user_name=" + user_name + ", email=" + email + ", phone="
				+ phone + ", password=" + password + ", join_date=" + join_date + ", update_date=" + update_date
				+ ", user_status=" + user_status + ", reason_leave=" + reason_leave + ", login_num=" + login_num
				+ ", business_user_no=" + business_user_no + ", office_name=" + office_name + ", office_regist_no="
				+ office_regist_no + ", business_license_no=" + business_license_no + ", office_address="
				+ office_address + ", office_phone=" + office_phone + ", status_agreement=" + status_agreement
				+ ", premium_status=" + premium_status + "]";
	}

	
	
	
}
