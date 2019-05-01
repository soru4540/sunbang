package org.kh.sunbang.interior.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Marker implements Serializable{

	private static final long serialVersionUID = 1223L;
	
	private int marker_no; //제품마커번호
	private String product_image; //제품이미지
	private int cordi_x; //x좌표
	private int cordi_y; //y좌표
	private String product_url; //url
	private int post_no; //게시물번호
	
	public Marker() {
		super();		
	}
	
	public Marker(int marker_no, String product_image, int cordi_x, int cordi_y, String product_url, int post_no) {
		super();
		this.marker_no = marker_no;
		this.product_image = product_image;
		this.cordi_x = cordi_x;
		this.cordi_y = cordi_y;
		this.product_url = product_url;
		this.post_no = post_no;
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
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Marker [marker_no=" + marker_no + ", product_image=" + product_image + ", cordi_x=" + cordi_x
				+ ", cordi_y=" + cordi_y + ", product_url=" + product_url + ", post_no=" + post_no + "]";
	}
	
	

}
