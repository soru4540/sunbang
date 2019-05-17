package org.kh.sunbang.user.controller;

import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;*/
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
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
/*	@Autowired
	private JavaMailSender sender;*/
	
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
	
	@RequestMapping(value="uinsert.do", method=RequestMethod.POST)
	public String insertUser(User user, HttpServletRequest request, Model model, @RequestParam(name="profile", required=false)MultipartFile profile) throws IllegalStateException, IOException{
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String user_profile = null;
		String savePath = request.getSession().getServletContext().getRealPath("files/user/userImages");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		if(!profile.isEmpty()) {
		user_profile = sdf.format(new Date(System.currentTimeMillis()))+"."+ profile.getOriginalFilename().substring(profile.getOriginalFilename().lastIndexOf(".") + 1);
		profile.transferTo(new File(savePath + "\\" + user_profile));
		user.setUser_profile(user_profile);
		}
		
		user.setPhone(phone);
		user.setUser_profile(user_profile);
		user.setPassword(bcyptPasswordEncoder.encode(user.getPassword()));
		
		if(userService.insertUser(user) > 0) {
			model.addAttribute("message", user.getNickname()+"님 회원가입을 축하드립니다");
			return "forward:uloginview.do";
		}else {
			model.addAttribute("message", "회원가입이 실패하였습니다");
			return "forward:uloginview.do";
		}
		
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
	@ResponseBody
	public void selectCheckId(@RequestParam(name="userid") String user_id, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(userService.selectCheckId(user_id) > 0) {
		out.append("fail");
		}else {
		out.append("success");
		}
		out.flush();
		out.close();} 
	
	//이메일
		/*@RequestMapping(value="ucheckemail.do", method = RequestMethod.POST)
		@ResponseBody
		public void selectCheckEmail(@RequestParam(name="email") String email, HttpServletResponse response) throws EmailException, IOException{
			String key = "1"; new TempKey().getKey(50, false);
			String title = "선방 사이트 이메일 인증을 위한 인증번호가 발급되었습니다";
			String content = new StringBuffer().
									append("이메일을 위한 인증번호를 확인하고 입력해주시기바랍니다 인증번호는").
									append(key).
									append("입니다").toString();
			
		
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom("pubemail19@gmail.com", "선방"); //보내는사람
			helper.setTo(email); //받는사람
			helper.setSubject(title); // 메일제목
			helper.setText(content); //메일내용
			helper.addInline(contentId, dataSource); //파일
			
			sender.send(message);
			HtmlEmail sendEmail = new HtmlEmail();
			sendEmail.setCharset("utf-8");
			sendEmail.setStartTLSEnabled(true);
			sendEmail.setHostName("smtp.gmail.com");
			sendEmail.setAuthenticator(new DefaultAuthenticator("pubemail19@gmail.com", "email0514"));
			sendEmail.setFrom("pubemail19@gmail.com", "선방");
			sendEmail.addTo("mylaughter@naver.com");
			sendEmail.setSmtpPort(587);
			sendEmail.setSubject(title);
			sendEmail.setMsg(content);
			sendEmail.send();
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.append(key);
			out.flush();
			out.close();
				
			
		}*/
	
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

			int result = userService.updatePremiumStatus(premium.getBusiness_user_no());
			
			HttpSession session = request.getSession(false);
			User loginUser = userService.selectUserNo(premium.getBusiness_user_no());
			session.setAttribute("loginUser", loginUser);
			
			return "realty/realtyMain";
		}else {
			model.addAttribute("message", "프리미엄 결제에 실패하였습니다.");
			return "common/error";
		}
	} 















}
