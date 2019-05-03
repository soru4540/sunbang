package org.kh.sunbang.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.sunbang.user.model.service.UserService;
import org.kh.sunbang.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	BCryptPasswordEncoder bcyptPasswordEncoder;
	
	
	@RequestMapping("uloginview.do")
	public String moveLoginView(){
		return "user/login";
	} 
	
	@RequestMapping("umyuserview.do")
	public String selectMyUserView(){
		return "user/myUser";
	}
	
	@RequestMapping("umydibs.do")
	public String selectMyDibs(){
		return "user/myDibs";
	}
	
	@RequestMapping("umylike.do")
	public String selectMyLike(){
		return "user/myLike";
	} 
	
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	public String login(User user, HttpSession session, /*@RequestParam(name="logincheck") String logincheck,*/ SessionStatus status, HttpServletResponse response, Model model) throws IOException{
		User loginUser = userService.selectLoginId(user);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(loginUser != null) {
		user.setUser_type(loginUser.getUser_type());
		user.setLogin_num(loginUser.getLogin_num());
		user.setUser_no(loginUser.getUser_no());
		User loginUserPwd = userService.selectLoginPwd(user);
			if(loginUserPwd != null) {
				loginUser.setLogin_num(0);
				int result = userService.updateLoginNum(loginUser);
				
				if(result > 0) {
					session.setAttribute("loginUser", loginUser);
					status.setComplete();
						return "forward:propertymain.do";
				}else {
					out.print("<script> location.href='uloginview.do';  alert('시도횟수 수정안됨');</script>");
					out.flush();
					out.close();
				}
			}else {
				loginUser.setLogin_num(loginUser.getLogin_num() + 1);
				int result = userService.updateLoginNum(loginUser);
				
				if(result > 0) {
					out.print("<script> location.href='uloginview.do'; alert('비밀번호 틀림');</script>");
					out.flush();
					out.close();
				}else {
					out.print("<script> location.href='uloginview.do'; alert('시도횟수 수정안됨');</script>");
					out.flush();
					out.close();
				}
			}
		}else {
			out.println("<script> location.href='uloginview.do'; alert('아이디 틀림');</script>");
			out.flush();
			out.close();
			
		}
		return null;
		
	} 

	@RequestMapping("ulogout.do")
	public String logout(HttpServletRequest request,@RequestParam(name="uri") String ReUri){
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "forward:uloginview.do";
	} 
	
	@RequestMapping("uinsert.do")
	public String insertUser(){
		return null;
	} 
	
	@RequestMapping("ufindid.do")
	public String selectFindId(){
		return null;
	} 

	@RequestMapping("ufindpwd.do")
	public String selectFindPwd(){return null;} 
	
	@RequestMapping("uupdate.do")
	public String updateUser(){return null;} 
	
	@RequestMapping("ucheckid.do")
	public String selectCheckId(){return null;} 
	
	@RequestMapping("ucheckemail.do")
	public String selectCheckEmail(){return null;} 
	
	@RequestMapping("ucheckphone.do")
	public String selectCheckPhone(){return null;} 
	
	@RequestMapping("uoffice.do")
	public String officeName(){return null;} 
	
	@RequestMapping("uchecklicense.do")
	public String selectCheckLicense(){return null;} 
	
	@RequestMapping("uupdatepwd.do")
	public String updatePwd(){return null;} 
	
	@RequestMapping("uuserout.do")
	public String updateUserOut(){return null;} 
	
	@RequestMapping("udibsmemo.do")
	public String updateDibsMemo(){return null;} 
	
	@RequestMapping("udeldibs.do")
	public String deleteDibs(){return null;} 
	
	@RequestMapping("udellike.do")
	public String deleteLike(){return null;} 

	
	// 프리미엄
	@RequestMapping("upview.do")
	public String premiumView(){return null;} 
	
	@RequestMapping("upinsert.do")
	public String insertPremium(){return null;} 
	
	@RequestMapping("upupdate.do")
	public String updatePremium(){return null;} 
	
}
