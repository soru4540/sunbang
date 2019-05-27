package org.kh.sunbang.user.controller;

import java.io.BufferedReader;   
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import org.apache.commons.mail.DefaultAuthenticator;  
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;*/
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.user.model.service.UserService;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.Uboard;
import org.kh.sunbang.user.model.vo.Urealty;
import org.kh.sunbang.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sun.misc.BASE64Encoder;

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
	public ModelAndView selectMyUserView(ModelAndView mv, @RequestParam(name="business_user_no", required=false)int business_user_no){
		Premium premium = userService.selectMyUser(business_user_no);
		mv.addObject("premium", premium);
		mv.setViewName("user/myUser");
		return mv;
	}
	
	@RequestMapping("umydibs.do")
	public ModelAndView selectMyDibs(ModelAndView mv, @RequestParam(name="user_no") int user_no){
		ArrayList<Urealty> urealty = userService.selectMyDibs(user_no);
		mv.addObject("urealty", urealty);
		mv.setViewName("user/myDibs");
		return mv;
	}
	
	@RequestMapping("umylike.do")
	public ModelAndView selectMyLike(ModelAndView mv, @RequestParam(name="user_no") int user_no){
		ArrayList<Uboard> uboard = userService.selectMyLike(user_no);
		mv.addObject("uboard", uboard);
		mv.setViewName("user/myLike");
		return mv;
	} 
	
	@RequestMapping(value="uulogin.do", method=RequestMethod.POST)
	@ResponseBody
	public void uuLogin(HttpSession session, SessionStatus status, HttpServletResponse response, @CookieValue(value="UG", required=false) String UG) {
		if(UG != null) {
		User loginUser = new User();
		loginUser.setUser_id(UG.split("/")[0]);
		loginUser.setUser_type(UG.split("/")[1]);
		User loginUserPwd = userService.selectUpdateLogin(loginUser);
		session.setAttribute("loginUser", loginUserPwd);
		status.setComplete();
		}
	}
	
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	@ResponseBody
	public void login(User user, HttpSession session, @RequestParam(name="logincheck", required=false) String logincheck, SessionStatus status, HttpServletResponse response) throws IOException{
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
				if(result < 5) {
					if(logincheck != null) {
						Cookie loginCookie = new Cookie("UG", loginUserPwd.getUser_id()+"/"+loginUserPwd.getUser_type());
						loginCookie.setPath("/sunbang");
						loginCookie.setMaxAge(60*60*24*7);
						response.addCookie(loginCookie);
					}
					loginUserPwd.setPassword(null);
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
				if(result < 5) {
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
			Cookie cookie = new Cookie("UG", null);
			cookie.setPath("/sunbang");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		if(ReUri == 1) {
			out.println("<script>location.href='realtymain.do'</script>");
			out.flush();
			
		}else if(ReUri == 2) {
			out.println("<script>location.href='interiormain.do'</script>");
			out.flush();
		}
		out.close();
	} 
	
	@RequestMapping(value="uinsert.do", method=RequestMethod.POST)
	public String insertUser(User user, HttpServletRequest request, RedirectAttributes redirectAttributes, @RequestParam(name="profile", required=false)MultipartFile profile) throws IllegalStateException, IOException{
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		if(request.getParameter("user_type").equals("공인중개사")) {
			String licenseNo = request.getParameter("license1")+"-"+request.getParameter("license2")+"-"+request.getParameter("license3");
			String officePhone = request.getParameter("ophone1")+"-"+request.getParameter("ophone2")+"-"+request.getParameter("ophone3");
			user.setBusiness_license_no(licenseNo);
			user.setOffice_phone(officePhone);
		}
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
			if(user.getUser_type().equals("일반회원")) {
			redirectAttributes.addFlashAttribute("messagetitle", "회원가입성공!");
			redirectAttributes.addFlashAttribute("message", user.getNickname()+"님 회원가입을 축하드립니다");
			}else {
			redirectAttributes.addFlashAttribute("messagetitle", "회원가입승인대기중!");
			redirectAttributes.addFlashAttribute("message", user.getNickname()+"님 회원가입을 축하드립니다. 가입승인후 매물등록이 가능합니다.");
			}
			return "redirect:uloginview.do";
		}else {
			redirectAttributes.addFlashAttribute("message", "회원가입이 실패하였습니다");
			return "redirect:uloginview.do";
		}
		
	} 
	
	@RequestMapping("capkey.do")
	@ResponseBody
	public void capchakey(HttpServletResponse response) throws IOException {
		String clientId = "kTR9HE2jFSzV6E2YixVE";
		String clientSecret = "zviTx6zlQj";
		
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=0";
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		while((inputLine = br.readLine()) != null) {
			out.append(inputLine);
			out.flush();
		}
		out.close();
		br.close();
	}
	
	@RequestMapping("capimage.do")
	@ResponseBody
	public void capchaImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String clientId = "kTR9HE2jFSzV6E2YixVE";
		String clientSecret = "zviTx6zlQj";
		
		String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+request.getParameter("key");
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
        if(responseCode == 200) {
        	InputStream is = con.getInputStream();
        	int read = 0;
        	byte[] bytes = new byte[1024];
        	String tempname = Long.valueOf(new Date().getTime()).toString();
        	String savePath = request.getSession().getServletContext().getRealPath("files/user/capchaImages");
        	File f = new File(savePath +"\\"+tempname + ".jpg");
        	f.createNewFile();
        	OutputStream outputStream = new FileOutputStream(f);
        	while((read = is.read(bytes)) != -1) {
        		outputStream.write(bytes, 0, read);
        	}
        	is.close();
        	out.append(tempname);
        	out.flush();
        }else {
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        	String inputLine;
        	while((inputLine = br.readLine()) != null) {
        		out.append(inputLine);
        		out.flush();
        	}
        	out.close();
        	br.close();
        }
	}
	
	@RequestMapping("capresult.do")
	@ResponseBody
	public void capchaResult(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String clientId = "kTR9HE2jFSzV6E2YixVE";
		String clientSecret = "zviTx6zlQj";
		
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=1&key="+request.getParameter("key")+"&value="+request.getParameter("value");
		
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
    	if(responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
    	String inputLine;
    	while((inputLine = br.readLine()) != null) {
    		out.append(inputLine);
    		out.flush();
    	}
    	out.close();
    	br.close();
	}
	
	@RequestMapping(value="ufindid.do",method=RequestMethod.POST)
	@ResponseBody
	public void selectFindId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		User user = new User();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		user.setPhone(phone);
		user.setUser_name(request.getParameter("user_name"));
		String result = userService.selectFindId(user);
		if(result != null) {
			out.append(result);
			out.flush();
		}else {
			out.append("fail");
			out.flush();
		}
		out.close();
	} 

	@RequestMapping(value="ufindpwd.do",method=RequestMethod.POST)
	@ResponseBody
	public void selectFindPwd(HttpServletRequest request, HttpServletResponse response) throws IOException{
		User user = new User();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		user.setPhone(phone);
		user.setUser_id(request.getParameter("user_id"));
		User result = userService.selectFindPwd(user);
		if(result != null) {
			out.append(String.valueOf(result.getUser_no()));
			out.flush();
		}else {
			out.append("fail");
			out.flush();
		}
		out.close();
	} 
	
	@RequestMapping(value="uupdate.do", method=RequestMethod.POST)
	public String updateUser(User user, HttpServletRequest request, RedirectAttributes redirectAttributes, @RequestParam(name="profile", required=false)MultipartFile profile, HttpSession session, SessionStatus status) throws IllegalStateException, IOException{
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		if(request.getParameter("user_type").equals("공인중개사")) {
			String licenseNo = request.getParameter("license1")+"-"+request.getParameter("license2")+"-"+request.getParameter("license3");
			String officePhone = request.getParameter("ophone1")+"-"+request.getParameter("ophone2")+"-"+request.getParameter("ophone3");
			user.setBusiness_license_no(licenseNo);
			user.setOffice_phone(officePhone);
		}
		String user_profile = null;
		String savePath = request.getSession().getServletContext().getRealPath("files/user/userImages");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		if(request.getParameter("resultimg").equals("false")) {
			user_profile =request.getParameter("checkimg");
		}
		if(request.getParameter("resultimg").equals("none")) {
			user_profile = null;
			File file = new File(savePath+"/"+request.getParameter("checkimg"));
			if(file.exists() == true) {
				file.delete();
			}
		}
		if(request.getParameter("resultimg").equals("true")) {
		if(!profile.isEmpty()) {
		user_profile = sdf.format(new Date(System.currentTimeMillis()))+"."+ profile.getOriginalFilename().substring(profile.getOriginalFilename().lastIndexOf(".") + 1);
		profile.transferTo(new File(savePath + "\\" + user_profile));
		user.setUser_profile(user_profile);
		if(request.getParameter("checkimg") != null) {
		File file = new File(savePath+"/"+request.getParameter("checkimg"));
		if(file.exists() == true) {
			file.delete();
		}}
		}
		}
		
		user.setPhone(phone);
		user.setUser_profile(user_profile);
		
		if(userService.updateUser(user) > 0) {
			User loginUserPwd = userService.selectUpdateLogin(user);
			loginUserPwd.setPassword(null);
			session.setAttribute("loginUser", loginUserPwd);
			status.setComplete();
			redirectAttributes.addFlashAttribute("messagetitle", "회원수정성공!");
			redirectAttributes.addFlashAttribute("message", user.getNickname()+"님 회원수정하셨습니다");
			return "redirect:umyuserview.do?business_user_no="+user.getBusiness_user_no();
		}else {
			redirectAttributes.addFlashAttribute("message", "회원수정이 실패하였습니다");
			return "redirect:umyuserview.do?business_user_no="+user.getBusiness_user_no();
		}
	} 
	
	@RequestMapping("uchecknick.do")
	@ResponseBody
	public void selectCheckNick(@RequestParam(name="nickname") String nickname, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(userService.selectCheckNick(nickname) > 0) {
		out.append("fail");
		}else {
		out.append("success");
		}
		out.flush();
		out.close();} 
	
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
	/*	@RequestMapping(value="ucheckemail.do", method = RequestMethod.POST)
		@ResponseBody
		public void selectCheckEmail(@RequestParam(name="email") String email, HttpServletResponse response) throws EmailException, IOException{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String num = String.valueOf((int)(Math.floor(Math.random() * (89999)) + 10000));
			String title = "선방 사이트 이메일 인증을 위한 인증번호가 발급되었습니다";
			String content = "이메일을 위한 인증번호를 확인하고 입력해주시기바랍니다 인증번호는["+num+"]입니다";
			
			HtmlEmail sendEmail = new HtmlEmail();
			sendEmail.setDebug(true);
			sendEmail.setCharset("utf-8");
			sendEmail.setHostName("smtp.naver.com");
			sendEmail.setSSLOnConnect(true);
			sendEmail.setStartTLSEnabled(true);
			sendEmail.setSmtpPort(587);
			sendEmail.setAuthenticator(new DefaultAuthenticator("", ""));
			sendEmail.addTo(email);
			sendEmail.setFrom("public18@naver.com", "선방", "utf-8");
			sendEmail.setSubject(num);
			sendEmail.setHtmlMsg(content);
			sendEmail.send();
			
			out.append(num);
			out.flush();
			out.close();
		}*/
	
	@RequestMapping(value="ucheckphone.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectCheckPhone(@RequestParam(name="phone") String phone,HttpServletResponse response) throws IOException{
		String num = String.valueOf((int)(Math.floor(Math.random() * (89999)) + 10000));
		String msg = "[선방]인증번호는"+num+" 입니다";
		
		BASE64Encoder encoder = new BASE64Encoder();
		String apiURL = "http://sslsms.cafe24.com/sms_sender.php";
		URL obj = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)obj.openConnection();
		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		con.setRequestProperty("Accept-Charset", "UTF-8");
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String postParams =
				"user_id=" + encoder.encode("".getBytes())
				+ "&secure=" + encoder.encode("".getBytes())
				+ "&msg=" + encoder.encode(msg.getBytes())
				+ "&rphone=" + encoder.encode(phone.getBytes())
				+ "&sphone1=" + encoder.encode("010".getBytes())
				+ "&sphone2=" + encoder.encode("9376".getBytes())
				+ "&sphone3=" + encoder.encode("5037".getBytes())
				+ "&mode=" + encoder.encode("1".getBytes())
				+ "&smsType=S";
		
		postParams += "&testflag="+encoder.encode("Y".getBytes());
        
        con.setDoOutput(true);
        OutputStream os = con.getOutputStream();
        os.write(postParams.getBytes());
        os.flush();
        os.close();
        
        int responseCode = con.getResponseCode();
        if(responseCode == HttpURLConnection.HTTP_OK) {
        	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        	String inputLine;
        	StringBuffer buf = new StringBuffer();
        	
        	while((inputLine = in.readLine()) != null) {
        		buf.append(inputLine);
        		out.append(num);
        		out.flush();
        	}
        	out.close();
        	in.close();
        	System.err.println(buf.toString());
        }else {
        }
	} 
	
	@RequestMapping("uoffice.do")
	public String officeName(){return null;} 
	
	@RequestMapping("uchecklicense.do")
	public String selectCheckLicense(){return null;} 
	
	@RequestMapping(value="uupdatepwd.do", method=RequestMethod.POST)
	@ResponseBody
	public void updatePwd(User user){
		user.setPassword(bcyptPasswordEncoder.encode(user.getPassword()));
		int result = userService.updatePwd(user);
	} 
	
	@RequestMapping(value="uuserout.do", method=RequestMethod.POST)
	public String updateUserOut(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes){
		HttpSession session = request.getSession(false);
		User user = new User();
		String reason = request.getParameter("reason1");
		if(request.getParameter("reason2") != null) {
			reason = request.getParameter("reason2");
		}
		user.setNickname(request.getParameter("nickname"));
		user.setUser_no(Integer.parseInt(request.getParameter("user_no")));
		user.setReason_leave(reason);
		if(userService.updateUserOut(user) > 0) {
			if(session != null) {
				session.invalidate();
			}
		redirectAttributes.addFlashAttribute("messagetitle", "회원탈퇴성공!");
		redirectAttributes.addFlashAttribute("message", user.getNickname()+"님 탈퇴하셨습니다");
		return "redirect:uloginview.do";
		}else {
		return "redirect:umyuserview.do";	
		}
	} 
	
	@RequestMapping(value="udibsmemo.do", method=RequestMethod.POST)
	public void updateDibsMemo(HttpServletResponse response, Dibs dibs){
		int result = userService.updateDibsMemo(dibs);
	} 
	
	@RequestMapping("udeldibs.do")
	public void deleteDibs(HttpServletResponse response, @RequestParam(name="dibs_no")int dibs_no){
		int result = userService.deleteDibs(dibs_no);
	} 
	
	@RequestMapping("udellike.do")
	public void deleteLike(HttpServletResponse response, @RequestParam(name="like_no")int like_no){
		int result = userService.deleteLike(like_no);
	} 

	
	// 프리미엄
	@RequestMapping("upview.do")
	public String premiumView(){return null;} 
	
	
	@RequestMapping("upupdate.do")
	@ResponseBody
	public String updatePremium(HttpServletRequest request){
		if(userService.updatePremium(Integer.parseInt(request.getParameter("charge_no"))) >0) {
			userService.updateUserPremium(Integer.parseInt(request.getParameter("business_user_no")));
			return "success";
		}else {
			return "fail";
		}
	} 

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
