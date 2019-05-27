package org.kh.sunbang.realty.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PRealty implements java.io.Serializable {
	private static final long serialVersionUID = 930205L;
	
	public PRealty() {}
	
	private int	realty_no;					//매물번호
	private Date registdate;				//매물등록일
	private Date renewdate;					//매물수정일
	private int realty_hits;				//조회수
	private String realty_status;			//매물상태
	private String realty_type;				//매물종류
	private String building_type;			//건물유형
	private String road_address;			//도로명주소
	private String land_lot;				//지번주소
	private String detail_address;			//상세주소
	private long month_lease;				//월세
	private long deposit;					//보증금
	private long payback_deposit_lease;		//전세
	private long purchase;					//매매
	private long residential;				//공급면적
	private long exclusive_area;			//전용면적
	private int	building_layers;			//건물층수
	private int	realty_layers;				//해당층수
	private int	heatting_system;			//난방종류
	private String move_available_date;		//입주가능일
	private int	management_pay;				//관리비
	private String parking_lot;				//주차여부
	private int	elevator;					//엘리베이터
	private int	builtin; 					//빌트인
	private int	allowance_pet;				//반려동물
	private int	balcony;					//베란다/발코니
	private int	loan_availability;			//전세자금대출
	private String structure;				//구조
	private int	airconditioner;				//에어컨
	private int	laundry_machine;			//세탁기
	private int	bed;						//침대
	private int	desk;						//책상
	private int	closet;						//옷장
	private int	tv;							//TV
	private int	gasrange;					//가스레인지
	private int	shoe_shelf;					//신발장
	private int	refrigerator;				//냉장고
	private int	induction;					//인덕션
	private int	microwave;					//전자레인지
	private int	door_lock;					//전자도어락
	private int bidet;						//비데
	private String realty_detail_title;		//상세정보제목
	private String realty_detail_comment;	//상세정보설명
	private String realty_image1;			//일반사진1
	private String realty_image2;			//일반사진2
	private String realty_image3;			//일반사진3
	private String realty_image4;			//일반사진4
	private String realty_image5;			//일반사진5
	private String realty_image6;			//일반사진6
	private String realty_image7;			//일반사진7
	private String realty_image8;			//일반사진8
	private String image360;				//360도사진
	private int user_no;					//회원번호
	private String premium;

	public PRealty(int realty_no, Date registdate, Date renewdate, int realty_hits, String realty_status,
			String realty_type, String building_type, String road_address, String land_lot, String detail_address,
			long month_lease, long deposit, long payback_deposit_lease, long purchase, long residential,
			long exclusive_area, int building_layers, int realty_layers, int heatting_system,
			String move_available_date, int management_pay, String parking_lot, int elevator, int builtin,
			int allowance_pet, int balcony, int loan_availability, String structure, int airconditioner,
			int laundry_machine, int bed, int desk, int closet, int tv, int gasrange, int shoe_shelf, int refrigerator,
			int induction, int microwave, int door_lock, int bidet, String realty_detail_title,
			String realty_detail_comment, String realty_image1, String realty_image2, String realty_image3,
			String realty_image4, String realty_image5, String realty_image6, String realty_image7,
			String realty_image8, String image360, int user_no, String premium) {
		super();
		this.realty_no = realty_no;
		this.registdate = registdate;
		this.renewdate = renewdate;
		this.realty_hits = realty_hits;
		this.realty_status = realty_status;
		this.realty_type = realty_type;
		this.building_type = building_type;
		this.road_address = road_address;
		this.land_lot = land_lot;
		this.detail_address = detail_address;
		this.month_lease = month_lease;
		this.deposit = deposit;
		this.payback_deposit_lease = payback_deposit_lease;
		this.purchase = purchase;
		this.residential = residential;
		this.exclusive_area = exclusive_area;
		this.building_layers = building_layers;
		this.realty_layers = realty_layers;
		this.heatting_system = heatting_system;
		this.move_available_date = move_available_date;
		this.management_pay = management_pay;
		this.parking_lot = parking_lot;
		this.elevator = elevator;
		this.builtin = builtin;
		this.allowance_pet = allowance_pet;
		this.balcony = balcony;
		this.loan_availability = loan_availability;
		this.structure = structure;
		this.airconditioner = airconditioner;
		this.laundry_machine = laundry_machine;
		this.bed = bed;
		this.desk = desk;
		this.closet = closet;
		this.tv = tv;
		this.gasrange = gasrange;
		this.shoe_shelf = shoe_shelf;
		this.refrigerator = refrigerator;
		this.induction = induction;
		this.microwave = microwave;
		this.door_lock = door_lock;
		this.bidet = bidet;
		this.realty_detail_title = realty_detail_title;
		this.realty_detail_comment = realty_detail_comment;
		this.realty_image1 = realty_image1;
		this.realty_image2 = realty_image2;
		this.realty_image3 = realty_image3;
		this.realty_image4 = realty_image4;
		this.realty_image5 = realty_image5;
		this.realty_image6 = realty_image6;
		this.realty_image7 = realty_image7;
		this.realty_image8 = realty_image8;
		this.image360 = image360;
		this.user_no = user_no;
		this.premium = premium;
	}

	public int getRealty_no() {
		return realty_no;
	}

	public void setRealty_no(int realty_no) {
		this.realty_no = realty_no;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public Date getRenewdate() {
		return renewdate;
	}

	public void setRenewdate(Date renewdate) {
		this.renewdate = renewdate;
	}

	public int getRealty_hits() {
		return realty_hits;
	}

	public void setRealty_hits(int realty_hits) {
		this.realty_hits = realty_hits;
	}

	public String getRealty_status() {
		return realty_status;
	}

	public void setRealty_status(String realty_status) {
		this.realty_status = realty_status;
	}

	public String getRealty_type() {
		return realty_type;
	}

	public void setRealty_type(String realty_type) {
		this.realty_type = realty_type;
	}

	public String getBuilding_type() {
		return building_type;
	}

	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public String getLand_lot() {
		return land_lot;
	}

	public void setLand_lot(String land_lot) {
		this.land_lot = land_lot;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public long getMonth_lease() {
		return month_lease;
	}

	public void setMonth_lease(long month_lease) {
		this.month_lease = month_lease;
	}

	public long getDeposit() {
		return deposit;
	}

	public void setDeposit(long deposit) {
		this.deposit = deposit;
	}

	public long getPayback_deposit_lease() {
		return payback_deposit_lease;
	}

	public void setPayback_deposit_lease(long payback_deposit_lease) {
		this.payback_deposit_lease = payback_deposit_lease;
	}

	public long getPurchase() {
		return purchase;
	}

	public void setPurchase(long purchase) {
		this.purchase = purchase;
	}

	public long getResidential() {
		return residential;
	}

	public void setResidential(long residential) {
		this.residential = residential;
	}

	public long getExclusive_area() {
		return exclusive_area;
	}

	public void setExclusive_area(long exclusive_area) {
		this.exclusive_area = exclusive_area;
	}

	public int getBuilding_layers() {
		return building_layers;
	}

	public void setBuilding_layers(int building_layers) {
		this.building_layers = building_layers;
	}

	public int getRealty_layers() {
		return realty_layers;
	}

	public void setRealty_layers(int realty_layers) {
		this.realty_layers = realty_layers;
	}

	public int getHeatting_system() {
		return heatting_system;
	}

	public void setHeatting_system(int heatting_system) {
		this.heatting_system = heatting_system;
	}

	public String getMove_available_date() {
		return move_available_date;
	}

	public void setMove_available_date(String move_available_date) {
		this.move_available_date = move_available_date;
	}

	public int getManagement_pay() {
		return management_pay;
	}

	public void setManagement_pay(int management_pay) {
		this.management_pay = management_pay;
	}

	public String getParking_lot() {
		return parking_lot;
	}

	public void setParking_lot(String parking_lot) {
		this.parking_lot = parking_lot;
	}

	public int getElevator() {
		return elevator;
	}

	public void setElevator(int elevator) {
		this.elevator = elevator;
	}

	public int getBuiltin() {
		return builtin;
	}

	public void setBuiltin(int builtin) {
		this.builtin = builtin;
	}

	public int getAllowance_pet() {
		return allowance_pet;
	}

	public void setAllowance_pet(int allowance_pet) {
		this.allowance_pet = allowance_pet;
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

	public String getStructure() {
		return structure;
	}

	public void setStructure(String structure) {
		this.structure = structure;
	}

	public int getAirconditioner() {
		return airconditioner;
	}

	public void setAirconditioner(int airconditioner) {
		this.airconditioner = airconditioner;
	}

	public int getLaundry_machine() {
		return laundry_machine;
	}

	public void setLaundry_machine(int laundry_machine) {
		this.laundry_machine = laundry_machine;
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

	public int getCloset() {
		return closet;
	}

	public void setCloset(int closet) {
		this.closet = closet;
	}

	public int getTv() {
		return tv;
	}

	public void setTv(int tv) {
		this.tv = tv;
	}

	public int getGasrange() {
		return gasrange;
	}

	public void setGasrange(int gasrange) {
		this.gasrange = gasrange;
	}

	public int getShoe_shelf() {
		return shoe_shelf;
	}

	public void setShoe_shelf(int shoe_shelf) {
		this.shoe_shelf = shoe_shelf;
	}

	public int getRefrigerator() {
		return refrigerator;
	}

	public void setRefrigerator(int refrigerator) {
		this.refrigerator = refrigerator;
	}

	public int getInduction() {
		return induction;
	}

	public void setInduction(int induction) {
		this.induction = induction;
	}

	public int getMicrowave() {
		return microwave;
	}

	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}

	public int getDoor_lock() {
		return door_lock;
	}

	public void setDoor_lock(int door_lock) {
		this.door_lock = door_lock;
	}

	public int getBidet() {
		return bidet;
	}

	public void setBidet(int bidet) {
		this.bidet = bidet;
	}

	public String getRealty_detail_title() {
		return realty_detail_title;
	}

	public void setRealty_detail_title(String realty_detail_title) {
		this.realty_detail_title = realty_detail_title;
	}

	public String getRealty_detail_comment() {
		return realty_detail_comment;
	}

	public void setRealty_detail_comment(String realty_detail_comment) {
		this.realty_detail_comment = realty_detail_comment;
	}

	public String getRealty_image1() {
		return realty_image1;
	}

	public void setRealty_image1(String realty_image1) {
		this.realty_image1 = realty_image1;
	}

	public String getRealty_image2() {
		return realty_image2;
	}

	public void setRealty_image2(String realty_image2) {
		this.realty_image2 = realty_image2;
	}

	public String getRealty_image3() {
		return realty_image3;
	}

	public void setRealty_image3(String realty_image3) {
		this.realty_image3 = realty_image3;
	}

	public String getRealty_image4() {
		return realty_image4;
	}

	public void setRealty_image4(String realty_image4) {
		this.realty_image4 = realty_image4;
	}

	public String getRealty_image5() {
		return realty_image5;
	}

	public void setRealty_image5(String realty_image5) {
		this.realty_image5 = realty_image5;
	}

	public String getRealty_image6() {
		return realty_image6;
	}

	public void setRealty_image6(String realty_image6) {
		this.realty_image6 = realty_image6;
	}

	public String getRealty_image7() {
		return realty_image7;
	}

	public void setRealty_image7(String realty_image7) {
		this.realty_image7 = realty_image7;
	}

	public String getRealty_image8() {
		return realty_image8;
	}

	public void setRealty_image8(String realty_image8) {
		this.realty_image8 = realty_image8;
	}

	public String getImage360() {
		return image360;
	}

	public void setImage360(String image360) {
		this.image360 = image360;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getpremium() {
		return premium;
	}

	public void setpremium(String premium) {
		this.premium = premium;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Realty [realty_no=" + realty_no + ", registdate=" + registdate + ", renewdate=" + renewdate
				+ ", realty_hits=" + realty_hits + ", realty_status=" + realty_status + ", realty_type=" + realty_type
				+ ", building_type=" + building_type + ", road_address=" + road_address + ", land_lot=" + land_lot
				+ ", detail_address=" + detail_address + ", month_lease=" + month_lease + ", deposit=" + deposit
				+ ", payback_deposit_lease=" + payback_deposit_lease + ", purchase=" + purchase + ", residential="
				+ residential + ", exclusive_area=" + exclusive_area + ", building_layers=" + building_layers
				+ ", realty_layers=" + realty_layers + ", heatting_system=" + heatting_system + ", move_available_date="
				+ move_available_date + ", management_pay=" + management_pay + ", parking_lot=" + parking_lot
				+ ", elevator=" + elevator + ", builtin=" + builtin + ", allowance_pet=" + allowance_pet + ", balcony="
				+ balcony + ", loan_availability=" + loan_availability + ", structure=" + structure
				+ ", airconditioner=" + airconditioner + ", laundry_machine=" + laundry_machine + ", bed=" + bed
				+ ", desk=" + desk + ", closet=" + closet + ", tv=" + tv + ", gasrange=" + gasrange + ", shoe_shelf="
				+ shoe_shelf + ", refrigerator=" + refrigerator + ", induction=" + induction + ", microwave="
				+ microwave + ", door_lock=" + door_lock + ", bidet=" + bidet + ", realty_detail_title="
				+ realty_detail_title + ", realty_detail_comment=" + realty_detail_comment + ", realty_image1="
				+ realty_image1 + ", realty_image2=" + realty_image2 + ", realty_image3=" + realty_image3
				+ ", realty_image4=" + realty_image4 + ", realty_image5=" + realty_image5 + ", realty_image6="
				+ realty_image6 + ", realty_image7=" + realty_image7 + ", realty_image8=" + realty_image8
				+ ", image360=" + image360 + ", user_no=" + user_no + ", premium=" + premium + ", getRealty_no()="
				+ getRealty_no() + ", getRegistdate()=" + getRegistdate() + ", getRenewdate()=" + getRenewdate()
				+ ", getRealty_hits()=" + getRealty_hits() + ", getRealty_status()=" + getRealty_status()
				+ ", getRealty_type()=" + getRealty_type() + ", getBuilding_type()=" + getBuilding_type()
				+ ", getRoad_address()=" + getRoad_address() + ", getLand_lot()=" + getLand_lot()
				+ ", getDetail_address()=" + getDetail_address() + ", getMonth_lease()=" + getMonth_lease()
				+ ", getDeposit()=" + getDeposit() + ", getPayback_deposit_lease()=" + getPayback_deposit_lease()
				+ ", getPurchase()=" + getPurchase() + ", getResidential()=" + getResidential()
				+ ", getExclusive_area()=" + getExclusive_area() + ", getBuilding_layers()=" + getBuilding_layers()
				+ ", getRealty_layers()=" + getRealty_layers() + ", getHeatting_system()=" + getHeatting_system()
				+ ", getMove_available_date()=" + getMove_available_date() + ", getManagement_pay()="
				+ getManagement_pay() + ", getParking_lot()=" + getParking_lot() + ", getElevator()=" + getElevator()
				+ ", getBuiltin()=" + getBuiltin() + ", getAllowance_pet()=" + getAllowance_pet() + ", getBalcony()="
				+ getBalcony() + ", getLoan_availability()=" + getLoan_availability() + ", getStructure()="
				+ getStructure() + ", getAirconditioner()=" + getAirconditioner() + ", getLaundry_machine()="
				+ getLaundry_machine() + ", getBed()=" + getBed() + ", getDesk()=" + getDesk() + ", getCloset()="
				+ getCloset() + ", getTv()=" + getTv() + ", getGasrange()=" + getGasrange() + ", getShoe_shelf()="
				+ getShoe_shelf() + ", getRefrigerator()=" + getRefrigerator() + ", getInduction()=" + getInduction()
				+ ", getMicrowave()=" + getMicrowave() + ", getDoor_lock()=" + getDoor_lock() + ", getBidet()="
				+ getBidet() + ", getRealty_detail_title()=" + getRealty_detail_title()
				+ ", getRealty_detail_comment()=" + getRealty_detail_comment() + ", getRealty_image1()="
				+ getRealty_image1() + ", getRealty_image2()=" + getRealty_image2() + ", getRealty_image3()="
				+ getRealty_image3() + ", getRealty_image4()=" + getRealty_image4() + ", getRealty_image5()="
				+ getRealty_image5() + ", getRealty_image6()=" + getRealty_image6() + ", getRealty_image7()="
				+ getRealty_image7() + ", getRealty_image8()=" + getRealty_image8() + ", getImage360()=" + getImage360()
				+ ", getUser_no()=" + getUser_no() + ", getpremium()=" + getpremium() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
