package org.kh.sunbang.user.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Premium implements java.io.Serializable{
	private static final long serialVersionUID = 951011L;

	private int charge_no;			//결제번호
	private Date charge_date;		//결제일자
	private Date expiration_date;	//프리미엄만료일
	private int charged_payment;	//구매금액
	private String charged_status;	//결제상태
	private Date refund_date;		//환불신청일
	private int business_user_no;	//기업회원번호
	
	public Premium() {}

	public Premium(int charge_no, Date charge_date, Date expiration_date, int charged_payment, String charged_status,
			Date refund_date, int business_user_no) {
		super();
		this.charge_no = charge_no;
		this.charge_date = charge_date;
		this.expiration_date = expiration_date;
		this.charged_payment = charged_payment;
		this.charged_status = charged_status;
		this.refund_date = refund_date;
		this.business_user_no = business_user_no;
	}

	public int getCharge_no() {
		return charge_no;
	}

	public void setCharge_no(int charge_no) {
		this.charge_no = charge_no;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}

	public Date getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}

	public int getCharged_payment() {
		return charged_payment;
	}

	public void setCharged_payment(int charged_payment) {
		this.charged_payment = charged_payment;
	}

	public String getCharged_status() {
		return charged_status;
	}

	public void setCharged_status(String charged_status) {
		this.charged_status = charged_status;
	}

	public Date getRefund_date() {
		return refund_date;
	}

	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}

	public int getBusiness_user_no() {
		return business_user_no;
	}

	public void setBusiness_user_no(int business_user_no) {
		this.business_user_no = business_user_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Premium [charge_no=" + charge_no + ", charge_date=" + charge_date + ", expiration_date="
				+ expiration_date + ", charged_payment=" + charged_payment + ", charged_status=" + charged_status
				+ ", refund_date=" + refund_date + ", business_user_no=" + business_user_no + "]";
	}
	
	
	
	
}
