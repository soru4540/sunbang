package org.kh.sunbang.realty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealtyController {

	@RequestMapping(value="propertymain.do")
	public String movePropertyMainMethod() {
		
		return "realty/propertyMain";
	}

//김성현----------------------------------------------------------------------------
	@RequestMapping("rdetail.do")
	public String moveRealtyDetailViewPage() {
		return "realty/realtyDetailView";
	}	
	
	@RequestMapping("r360.do")
	public String image360View() {
		return "realty/realty360Image";
	}	
	
	@RequestMapping("rinsert.do")
	public String moveRealtyInsertViewPage() {
		return "realty/realtyInsertView";
	}
	
	@RequestMapping("rmylist.do")
	public String moveRealtyMyListPage() {
		return "realty/realtyMyListView";
	}	
	
	@RequestMapping("rupdate.do")
	public String moveRealtyUpdateViewPage() {
		return "realty/realtyUpdateView";
	}	
}
