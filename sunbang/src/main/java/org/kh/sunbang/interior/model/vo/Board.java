package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable {

	private static final long serialVersionUID = 1221L;
	
	private int board_no; //게시판번호
	private String board_type; //게시판종류
	private String space; //공간
	private String housing_type; //주거형태
	private String category1; //카테고리1
	private String category2; //카테고리2
	private String category3; //카테고리3
	private int floor_area; //평수
	private String color1; //색상1
	private String color2; //색상2
	private String color3; //색상3
	private String board_title; //제목
	private int budget; //예산
	private String style; //스타일
	private int board_hits; //조회수
	private Date board_date; //등록날짜
	private int board_status; //게시판상태
	private int user_no; //회원번호
	
	public Board() {
		super();		
	}

	public Board(int board_no, String board_type, String space, String housing_type, String category1, String category2,
			String category3, int floor_area, String color1, String color2, String color3, String board_title,
			int budget, String style, int board_hits, Date board_date, int board_status, int user_no) {
		super();
		this.board_no = board_no;
		this.board_type = board_type;
		this.space = space;
		this.housing_type = housing_type;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.floor_area = floor_area;
		this.color1 = color1;
		this.color2 = color2;
		this.color3 = color3;
		this.board_title = board_title;
		this.budget = budget;
		this.style = style;
		this.board_hits = board_hits;
		this.board_date = board_date;
		this.board_status = board_status;
		this.user_no = user_no;
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

	public String getSpace() {
		return space;
	}

	public void setSpace(String space) {
		this.space = space;
	}

	public String getHousing_type() {
		return housing_type;
	}

	public void setHousing_type(String housing_type) {
		this.housing_type = housing_type;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}

	public int getFloor_area() {
		return floor_area;
	}

	public void setFloor_area(int floor_area) {
		this.floor_area = floor_area;
	}

	public String getColor1() {
		return color1;
	}

	public void setColor1(String color1) {
		this.color1 = color1;
	}

	public String getColor2() {
		return color2;
	}

	public void setColor2(String color2) {
		this.color2 = color2;
	}

	public String getColor3() {
		return color3;
	}

	public void setColor3(String color3) {
		this.color3 = color3;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public int getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_status() {
		return board_status;
	}

	public void setBoard_status(int board_status) {
		this.board_status = board_status;
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
		return "Board [board_no=" + board_no + ", board_type=" + board_type + ", space=" + space + ", housing_type="
				+ housing_type + ", category1=" + category1 + ", category2=" + category2 + ", category3=" + category3
				+ ", floor_area=" + floor_area + ", color1=" + color1 + ", color2=" + color2 + ", color3=" + color3
				+ ", board_title=" + board_title + ", budget=" + budget + ", style=" + style + ", board_hits="
				+ board_hits + ", board_date=" + board_date + ", board_status=" + board_status + ", user_no=" + user_no
				+ "]";
	}
	
	
	
	
	
}
