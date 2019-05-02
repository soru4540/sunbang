package org.kh.sunbang.admin.controller;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.service.AdminService;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.realty.model.vo.Realty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	// AdminService DI
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="adminPage.do")
	public String moveAdminPageMethod() {
		return "admin/adminPage";
	}
	
	@RequestMapping("aulistselect.do")
	public ModelAndView selectUnHandledList(ModelAndView mv) {
		
		ArrayList<Report> rlist = adminService.selectUnHandledList();
		
		if(rlist != null) {
			mv.addObject("rlist", rlist);
			mv.setViewName("admin/adminPage");
		}else {
			mv.addObject("message", "미처리 신고 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}	
}
