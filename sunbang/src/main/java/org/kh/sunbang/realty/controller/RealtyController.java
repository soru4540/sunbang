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
	public ModelAndView selectRealtyDetailView(
			ModelAndView mv, @RequestParam(name="realty_no") int realty_no) {
		
		//매물 조회수 증가
		realtyService.updateRealtyHits(realty_no);
		
		Realty realty = realtyService.selectRealtyDetailView(realty_no);
		
		if(realty != null) {
			mv.addObject("realty", realty);
			mv.setViewName("realty/realtyDetailView");
		}else {
			mv.addObject("message", "매물정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}	
	
	@RequestMapping("r360.do")
	public String selectImage360View() {
		return "realty/realty360Image";
	}	
	
	@RequestMapping("rinsertview.do")
	public String insertRealtyView() {
		return "realty/realtyInsertView";
	}
	
	@RequestMapping("rinsert.do")
	public String insertRealty() {
		return "realty/realtyInsertView";
	}
	
	@RequestMapping("rmylist.do")
	public String selectRealtyMyListView() {
		return "realty/realtyMyListView";
	}	
	
	@RequestMapping("rupdateview.do")
	public String updateRealtyView() {
		return "realty/realtyUpdateView";
	}	
	
	@RequestMapping("rupdate.do")
	public String updateRealty() {
		return "realty/realtyUpdateView";
	}	
}
