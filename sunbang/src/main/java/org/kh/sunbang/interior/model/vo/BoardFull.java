package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardFull implements Serializable{

	private static final long serialVersionUID = 12200L;

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
	
	private int post_no; //게시물번호
	private String post_keyword; //키워드
	private String post_data; //데이터
	private String post_contents; //텍스트
		
	private int marker_no; //제품마커번호
	private String product_image; //제품이미지
	private int cordi_x; //x좌표
	private int cordi_y; //y좌표
	private String product_url; //url
	
	public BoardFull() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardFull(int board_no, String board_type, String space, String housing_type, String category1,
			String category2, String category3, int floor_area, String color1, String color2, String color3,
			String board_title, int budget, String style, int board_hits, Date board_date, int board_status,
			int user_no, int post_no, String post_keyword, String post_data, String post_contents, int marker_no,
			String product_image, int cordi_x, int cordi_y, String product_url) {
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
		this.post_no = post_no;
		this.post_keyword = post_keyword;
		this.post_data = post_data;
		this.post_contents = post_contents;
		this.marker_no = marker_no;
		this.product_image = product_image;
		this.cordi_x = cordi_x;
		this.cordi_y = cordi_y;
		this.product_url = product_url;
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
	public String getPost_data() {
		return post_data;
	}
	public void setPost_data(String post_data) {
		this.post_data = post_data;
	}
	public String getPost_contents() {
		return post_contents;
	}
	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}
	public int getMarker_no() {
		return marker_no;
	}
	public void setMarker_no(int marker_no) {
		this.marker_no = marker_no;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getCordi_x() {
		return cordi_x;
	}
	public void setCordi_x(int cordi_x) {
		this.cordi_x = cordi_x;
	}
	public int getCordi_y() {
		return cordi_y;
	}
	public void setCordi_y(int cordi_y) {
		this.cordi_y = cordi_y;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "BoardFull [board_no=" + board_no + ", board_type=" + board_type + ", space=" + space + ", housing_type="
				+ housing_type + ", category1=" + category1 + ", category2=" + category2 + ", category3=" + category3
				+ ", floor_area=" + floor_area + ", color1=" + color1 + ", color2=" + color2 + ", color3=" + color3
				+ ", board_title=" + board_title + ", budget=" + budget + ", style=" + style + ", board_hits="
				+ board_hits + ", board_date=" + board_date + ", board_status=" + board_status + ", user_no=" + user_no
				+ ", post_no=" + post_no + ", post_keyword=" + post_keyword + ", post_data=" + post_data
				+ ", post_contents=" + post_contents + ", marker_no=" + marker_no + ", product_image=" + product_image
				+ ", cordi_x=" + cordi_x + ", cordi_y=" + cordi_y + ", product_url=" + product_url + "]";
	}

	
	
}