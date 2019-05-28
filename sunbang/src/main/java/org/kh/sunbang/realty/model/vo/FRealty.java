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
	private int min_monthly;
	private int max_monthly;	
	private int min_payback;
	private int max_payback;
	private int min_purchase;
	private int max_purchase;
	private int min_area;
	private int max_area;
	private int elevator;
	private int allowance_pet;
	private int parking_lot;
	private int bidet;
	private int builtin;
	private int bed;
	private int desk;
	private int airconditioner;
	private int balcony;
	private int loan_availability;
	private int tv;
	private int induction;
	private int door_lock;
	private int microwave;
	private int refrigerator;
	private int laundry_machine;
	
	public FRealty() {}

	public FRealty(String oneroom, String tworoom, String threeroom, String officetel, String apartment,
			int min_monthly, int max_monthly, int min_payback, int max_payback, int min_purchase, int max_purchase,
			int min_area, int max_area, int elevator, int allowance_pet, int parking_lot, int bidet, int builtin,
			int bed, int desk, int airconditioner, int balcony, int loan_availability, int tv, int induction,
			int door_lock, int microwave, int refrigerator, int laundry_machine) {
		super();
		this.oneroom = oneroom;
		this.tworoom = tworoom;
		this.threeroom = threeroom;
		this.officetel = officetel;
		this.apartment = apartment;
		this.min_monthly = min_monthly;
		this.max_monthly = max_monthly;
		this.min_payback = min_payback;
		this.max_payback = max_payback;
		this.min_purchase = min_purchase;
		this.max_purchase = max_purchase;
		this.min_area = min_area;
		this.max_area = max_area;
		this.elevator = elevator;
		this.allowance_pet = allowance_pet;
		this.parking_lot = parking_lot;
		this.bidet = bidet;
		this.builtin = builtin;
		this.bed = bed;
		this.desk = desk;
		this.airconditioner = airconditioner;
		this.balcony = balcony;
		this.loan_availability = loan_availability;
		this.tv = tv;
		this.induction = induction;
		this.door_lock = door_lock;
		this.microwave = microwave;
		this.refrigerator = refrigerator;
		this.laundry_machine = laundry_machine;
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

	public int getElevator() {
		return elevator;
	}

	public void setElevator(int elevator) {
		this.elevator = elevator;
	}

	public int getAllowance_pet() {
		return allowance_pet;
	}

	public void setAllowance_pet(int allowance_pet) {
		this.allowance_pet = allowance_pet;
	}

	public int getParking_lot() {
		return parking_lot;
	}

	public void setParking_lot(int parking_lot) {
		this.parking_lot = parking_lot;
	}

	public int getBidet() {
		return bidet;
	}

	public void setBidet(int bidet) {
		this.bidet = bidet;
	}

	public int getBuiltin() {
		return builtin;
	}

	public void setBuiltin(int builtin) {
		this.builtin = builtin;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getDesk() {
		return desk;
	}

	public void setDesk(int desk) {
		this.desk = desk;
	}

	public int getAirconditioner() {
		return airconditioner;
	}

	public void setAirconditioner(int airconditioner) {
		this.airconditioner = airconditioner;
	}

	public int getBalcony() {
		return balcony;
	}

	public void setBalcony(int balcony) {
		this.balcony = balcony;
	}

	public int getLoan_availability() {
		return loan_availability;
	}

	public void setLoan_availability(int loan_availability) {
		this.loan_availability = loan_availability;
	}

	public int getTv() {
		return tv;
	}

	public void setTv(int tv) {
		this.tv = tv;
	}

	public int getInduction() {
		return induction;
	}

	public void setInduction(int induction) {
		this.induction = induction;
	}

	public int getDoor_lock() {
		return door_lock;
	}

	public void setDoor_lock(int door_lock) {
		this.door_lock = door_lock;
	}

	public int getMicrowave() {
		return microwave;
	}

	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}

	public int getRefrigerator() {
		return refrigerator;
	}

	public void setRefrigerator(int refrigerator) {
		this.refrigerator = refrigerator;
	}

	public int getLaundry_machine() {
		return laundry_machine;
	}

	public void setLaundry_machine(int laundry_machine) {
		this.laundry_machine = laundry_machine;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FRealty [oneroom=" + oneroom + ", tworoom=" + tworoom + ", threeroom=" + threeroom + ", officetel="
				+ officetel + ", apartment=" + apartment + ", min_monthly=" + min_monthly + ", max_monthly="
				+ max_monthly + ", min_payback=" + min_payback + ", max_payback=" + max_payback + ", min_purchase="
				+ min_purchase + ", max_purchase=" + max_purchase + ", min_area=" + min_area + ", max_area=" + max_area
				+ ", elevator=" + elevator + ", allowance_pet=" + allowance_pet + ", parking_lot=" + parking_lot
				+ ", bidet=" + bidet + ", builtin=" + builtin + ", bed=" + bed + ", desk=" + desk + ", airconditioner="
				+ airconditioner + ", balcony=" + balcony + ", loan_availability=" + loan_availability + ", tv=" + tv
				+ ", induction=" + induction + ", door_lock=" + door_lock + ", microwave=" + microwave
				+ ", refrigerator=" + refrigerator + ", laundry_machine=" + laundry_machine + "]";
	}

	
	}
