package org.kh.sunbang.user.controller;

import org.kh.sunbang.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	
	@RequestMapping("loginview.do")
	public String loginView(){
		return "user/login";
	}
	
	@RequestMapping("userupdateview.do")
	public String myUserUpdateView(){
		return "user/myUserUpdate";
	}
	
	@RequestMapping("mycheckview.do")
	public String myCheckView(){
		return "user/myCheck";
	}
	
	@RequestMapping("mylikeview.do")
	public String myLikeView(){
		return "user/myLike";
	}
	
}
