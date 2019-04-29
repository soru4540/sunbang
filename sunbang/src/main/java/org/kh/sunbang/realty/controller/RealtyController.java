package org.kh.sunbang.realty.controller;

import org.kh.sunbang.realty.model.service.RealtyService;
import org.kh.sunbang.realty.model.vo.Realty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RealtyController {
	//RealtyService DI
	@Autowired
	private RealtyService realtyService;
	
	
	@RequestMapping(value="propertymain.do")
	public String movePropertyMainMethod() {
		
		return "realty/propertyMain";
	}

//김성현----------------------------------------------------------------------------
	@RequestMapping("rdetail.do")
	public ModelAndView selectRealtyDetail(
			ModelAndView mv, @RequestParam(name="realty_no") int realty_no) {
		
		Realty realty = realtyService.selectRealtyDetail(realty_no);
		
		mv.addObject("realty", realty);
		mv.setViewName("realty/realtyDetailView");
		
		return mv;
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
