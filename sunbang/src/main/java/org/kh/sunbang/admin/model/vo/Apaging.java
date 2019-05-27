package org.kh.sunbang.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Apaging implements java.io.Serializable {
	private static final long serialVersionUID = 901026L;

	private int page;
	private int maxpage;
	private int startpage;
	private int endpage;
	private int limit;
	private String selectval;
	private String keyword;
	private String system;

	public Apaging() {
	}

	public Apaging(int page, int maxpage, int startpage, int endpage, int limit, String selectval, String keyword,
			String system) {
		super();
		this.page = page;
		this.maxpage = maxpage;
		this.startpage = startpage;
		this.endpage = endpage;
		this.limit = limit;
		this.selectval = selectval;
		this.keyword = keyword;
		this.system = system;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getMaxpage() {
		return maxpage;
	}

	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getSelectval() {
		return selectval;
	}

	public void setSelectval(String selectval) {
		this.selectval = selectval;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Apaging [page=" + page + ", maxpage=" + maxpage + ", startpage=" + startpage + ", endpage=" + endpage
				+ ", limit=" + limit + ", selectval=" + selectval + ", keyword=" + keyword + ", system=" + system + "]";
	}
	
}
