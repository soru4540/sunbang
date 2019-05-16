package org.kh.sunbang.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.sunbang.user.model.service.UserService;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public void login(User user, HttpSession session, /*@RequestParam(name="logincheck") String logincheck,*/ SessionStatus status, HttpServletResponse response) throws IOException{
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
					session.setAttribute("loginUser", loginUserPwd);
					status.setComplete();
					out.append("success");
					out.flush();
				}else {
					out.append("countfail");
					out.flush();
				}
			}else {
				loginUser.setLogin_num(loginUser.getLogin_num() + 1);
				int result = userService.updateLoginNum(loginUser);
				
				if(result > 0) {
					out.append("pwdfail");
					out.flush();
				}else {
					out.append("countfail");
					out.flush();
				}
			}
		}else {
			out.append("idfail");
			out.flush();
		}
		out.close();
	} 

	@RequestMapping("ulogout.do")
	public void logout(HttpServletRequest request,@RequestParam(name="uri") int ReUri, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(false);
		PrintWriter out =response.getWriter();
		
		if(session != null) {
			session.invalidate();
		}
		if(ReUri == 1) {
			out.println("<script>location.href='realtymain.do'</script>");
		}else if(ReUri == 2)
			out.println("<script>location.href='interiormain.do'</script>");
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
	
	
	@RequestMapping("upupdate.do")
	public String updatePremium(){return null;} 

	// 김성현
	@RequestMapping(value="upinsert.do", method=RequestMethod.POST)
	public String insertPremium(Premium premium, HttpServletRequest request,
			@RequestParam(name="premium_type") String pType, Model model){
		
		premium.setCharged_status(pType);
		
		if(userService.insertPremium(premium) > 0) {
			return "realty/realtyMain";
		}else {
			model.addAttribute("message", "프리미엄 결제에 실패하였습니다.");
			return "common/error";
		}
	} 















}
