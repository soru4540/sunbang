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
	private String contents;
	private int guide_status;
	
	public Guide() {}

	public Guide(int guide_no, String guide_system, String category, String title, String thumbnail, String contents,
			int guide_status) {
		super();
		this.guide_no = guide_no;
		this.guide_system = guide_system;
		this.category = category;
		this.title = title;
		this.thumbnail = thumbnail;
		this.contents = contents;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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
				+ title + ", thumbnail=" + thumbnail + ", contents=" + contents + ", guide_status=" + guide_status
				+ "]";
	}
	
}