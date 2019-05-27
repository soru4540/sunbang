package org.kh.sunbang.admin.model.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component
public class Report implements java.io.Serializable {
	private static final long serialVersionUID = 901024L;

	private int report_no;
	private String report_system;
	private String category;
	private String reported_board;
	private int contents_no;
	private String contents;
	private String contents_status;
	private Date report_date;
	private Date handle_date;
	private int report_status;
	private int user_no;
	private String user_id;
	

	public Report() {
	}


	public Report(int report_no, String report_system, String category, String reported_board, int contents_no,
			String contents, String contents_status, Date report_date, Date handle_date, int report_status, int user_no,
			String user_id) {
		super();
		this.report_no = report_no;
		this.report_system = report_system;
		this.category = category;
		this.reported_board = reported_board;
		this.contents_no = contents_no;
		this.contents = contents;
		this.contents_status = contents_status;
		this.report_date = report_date;
		this.handle_date = handle_date;
		this.report_status = report_status;
		this.user_no = user_no;
		this.user_id = user_id;
	}


	public int getReport_no() {
		return report_no;
	}


	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}


	public String getReport_system() {
		return report_system;
	}


	public void setReport_system(String report_system) {
		this.report_system = report_system;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getReported_board() {
		return reported_board;
	}


	public void setReported_board(String reported_board) {
		this.reported_board = reported_board;
	}


	public int getContents_no() {
		return contents_no;
	}


	public void setContents_no(int contents_no) {
		this.contents_no = contents_no;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getContents_status() {
		return contents_status;
	}


	public void setContents_status(String contents_status) {
		this.contents_status = contents_status;
	}


	public Date getReport_date() {
		return report_date;
	}


	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}


	public Date getHandle_date() {
		return handle_date;
	}


	public void setHandle_date(Date handle_date) {
		this.handle_date = handle_date;
	}


	public int getReport_status() {
		return report_status;
	}


	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", report_system=" + report_system + ", category=" + category
				+ ", reported_board=" + reported_board + ", contents_no=" + contents_no + ", contents=" + contents
				+ ", contents_status=" + contents_status + ", report_date=" + report_date + ", handle_date="
				+ handle_date + ", report_status=" + report_status + ", user_no=" + user_no + ", user_id=" + user_id
				+ "]";
	}

	
}
