package org.kh.sunbang.realty.model.vo;

import org.springframework.stereotype.Component;

@Component
public class FRealty implements java.io.Serializable{
	private static final long serialVersionUID = 7910L;
	
	
	private String oneroom;
	private String tworoom;
	private String threeroom;
	private String officetel;
	private String apartment;
	private String monthly_lease;
	private int min_monthly;
	private int max_monthly;
	private String payback_deposit_lease;
	private int min_payback;
	private int max_payback;
	private String purchase;
	private int min_purchase;
	private int max_purchase;
	private int min_area;
	private int max_area;

	public FRealty() {}

	public FRealty(String oneroom, String tworoom, String threeroom, String officetel, String apartment,
			String monthly_lease, int min_monthly, int max_monthly, String payback_deposit_lease, int min_payback,
			int max_payback, String purchase, int min_purchase, int max_purchase, int min_area, int max_area) {
		super();
		this.oneroom = oneroom;
		this.tworoom = tworoom;
		this.threeroom = threeroom;
		this.officetel = officetel;
		this.apartment = apartment;
		this.monthly_lease = monthly_lease;
		this.min_monthly = min_monthly;
		this.max_monthly = max_monthly;
		this.payback_deposit_lease = payback_deposit_lease;
		this.min_payback = min_payback;
		this.max_payback = max_payback;
		this.purchase = purchase;
		this.min_purchase = min_purchase;
		this.max_purchase = max_purchase;
		this.min_area = min_area;
		this.max_area = max_area;
	}

	public String getOneroom() {
		return oneroom;
	}

	public void setOneroom(String oneroom) {
		this.oneroom = oneroom;
	}

	public String getTworoom() {
		return tworoom;
	}

	public void setTworoom(String tworoom) {
		this.tworoom = tworoom;
	}

	public String getThreeroom() {
		return threeroom;
	}

	public void setThreeroom(String threeroom) {
		this.threeroom = threeroom;
	}

	public String getOfficetel() {
		return officetel;
	}

	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}

	public String getApartment() {
		return apartment;
	}

	public void setApartment(String apartment) {
		this.apartment = apartment;
	}

	public String getMonthly_lease() {
		return monthly_lease;
	}

	public void setMonthly_lease(String monthly_lease) {
		this.monthly_lease = monthly_lease;
	}

	public int getMin_monthly() {
		return min_monthly;
	}

	public void setMin_monthly(int min_monthly) {
		this.min_monthly = min_monthly;
	}

	public int getMax_monthly() {
		return max_monthly;
	}

	public void setMax_monthly(int max_monthly) {
		this.max_monthly = max_monthly;
	}

	public String getPayback_deposit_lease() {
		return payback_deposit_lease;
	}

	public void setPayback_deposit_lease(String payback_deposit_lease) {
		this.payback_deposit_lease = payback_deposit_lease;
	}

	public int getMin_payback() {
		return min_payback;
	}

	public void setMin_payback(int min_payback) {
		this.min_payback = min_payback;
	}

	public int getMax_payback() {
		return max_payback;
	}

	public void setMax_payback(int max_payback) {
		this.max_payback = max_payback;
	}

	public String getPurchase() {
		return purchase;
	}

	public void setPurchase(String purchase) {
		this.purchase = purchase;
	}

	public int getMin_purchase() {
		return min_purchase;
	}

	public void setMin_purchase(int min_purchase) {
		this.min_purchase = min_purchase;
	}

	public int getMax_purchase() {
		return max_purchase;
	}

	public void setMax_purchase(int max_purchase) {
		this.max_purchase = max_purchase;
	}

	public int getMin_area() {
		return min_area;
	}

	public void setMin_area(int min_area) {
		this.min_area = min_area;
	}

	public int getMax_area() {
		return max_area;
	}

	public void setMax_area(int max_area) {
		this.max_area = max_area;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FRealty [oneroom=" + oneroom + ", tworoom=" + tworoom + ", threeroom=" + threeroom + ", officetel="
				+ officetel + ", apartment=" + apartment + ", monthly_lease=" + monthly_lease + ", min_monthly="
				+ min_monthly + ", max_monthly=" + max_monthly + ", payback_deposit_lease=" + payback_deposit_lease
				+ ", min_payback=" + min_payback + ", max_payback=" + max_payback + ", purchase=" + purchase
				+ ", min_purchase=" + min_purchase + ", max_purchase=" + max_purchase + ", min_area=" + min_area
				+ ", max_area=" + max_area + "]";
	}
	
	
	}
