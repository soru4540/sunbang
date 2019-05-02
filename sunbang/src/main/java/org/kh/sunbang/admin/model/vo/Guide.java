package org.kh.sunbang.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Guide implements java.io.Serializable {
	private static final long serialVersionUID = 901023L;
	
	private int guide_no;
	private String guide_system;
	private String category;
	private String title;
	private String thumbnail;
	private String guide_image1;
	private String guide_image2;
	private String guide_image3;
	private String guide_image4;
	private String guide_image5;
	private int guide_status;
	
	public Guide() {}

	public Guide(int guide_no, String guide_system, String category, String title, String thumbnail,
			String guide_image1, String guide_image2, String guide_image3, String guide_image4, String guide_image5,
			int guide_status) {
		super();
		this.guide_no = guide_no;
		this.guide_system = guide_system;
		this.category = category;
		this.title = title;
		this.thumbnail = thumbnail;
		this.guide_image1 = guide_image1;
		this.guide_image2 = guide_image2;
		this.guide_image3 = guide_image3;
		this.guide_image4 = guide_image4;
		this.guide_image5 = guide_image5;
		this.guide_status = guide_status;
	}

	public int getGuide_no() {
		return guide_no;
	}

	public void setGuide_no(int guide_no) {
		this.guide_no = guide_no;
	}

	public String getGuide_system() {
		return guide_system;
	}

	public void setGuide_system(String guide_system) {
		this.guide_system = guide_system;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getGuide_image1() {
		return guide_image1;
	}

	public void setGuide_image1(String guide_image1) {
		this.guide_image1 = guide_image1;
	}

	public String getGuide_image2() {
		return guide_image2;
	}

	public void setGuide_image2(String guide_image2) {
		this.guide_image2 = guide_image2;
	}

	public String getGuide_image3() {
		return guide_image3;
	}

	public void setGuide_image3(String guide_image3) {
		this.guide_image3 = guide_image3;
	}

	public String getGuide_image4() {
		return guide_image4;
	}

	public void setGuide_image4(String guide_image4) {
		this.guide_image4 = guide_image4;
	}

	public String getGuide_image5() {
		return guide_image5;
	}

	public void setGuide_image5(String guide_image5) {
		this.guide_image5 = guide_image5;
	}

	public int getGuide_status() {
		return guide_status;
	}

	public void setGuide_status(int guide_status) {
		this.guide_status = guide_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Guide [guide_no=" + guide_no + ", guide_system=" + guide_system + ", category=" + category + ", title="
				+ title + ", thumbnail=" + thumbnail + ", guide_image1=" + guide_image1 + ", guide_image2="
				+ guide_image2 + ", guide_image3=" + guide_image3 + ", guide_image4=" + guide_image4 + ", guide_image5="
				+ guide_image5 + ", guide_status=" + guide_status + "]";
	}
	
	
	
}
