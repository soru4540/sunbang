package org.kh.sunbang.chat.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.kh.sunbang.chat.model.service.ChatService;
import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
import org.kh.sunbang.user.model.vo.User;
import org.springframework.aop.aspectj.annotation.LazySingletonAspectInstanceFactoryDecorator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.sf.json.JSONArray;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 채팅방
	@RequestMapping("cmyview.do")
	public ModelAndView mychatView(ModelAndView mv, HttpServletRequest request){
		if(request.getParameter("user_no") !=null) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int result = chatService.selectOpenAdmin(user_no);
			mv.addObject("openadmin", result);
		}
		mv.setViewName("chat/myChat");
		return mv;}
	
	@RequestMapping("chatview.do")
	public String mychatViews(){
		return "chat/chat";}
	
	@RequestMapping("interiorchatview.do")
	public String mychatViewss(){
		return "chat/InteriorChat";}
	
	@RequestMapping("cfilter.do")
	public ModelAndView listFilterChat(){return null;} 
	
	@RequestMapping("cmyfilter.do")
	public void myListFilterChat(HttpServletResponse response, @RequestParam(name="userno") int userno) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Chat> list = chatService.selectMyListFilterChat(userno);
		
		JSONObject sendObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Chat chat : list) {
			JSONObject jchat = new JSONObject();
			
			jchat.put("chat_no", chat.getChat_no());
			jchat.put("user_no", chat.getUser_no());
			jchat.put("chat_name", chat.getChat_name());
			jchat.put("chat_type", chat.getChat_type());
			jchat.put("alert_status", chat.getAlert_status());
			jchat.put("join_time", chat.getJoin_time());
			jchat.put("away_time", chat.getAway_time());
			jchat.put("check_join", chat.getCheck_join());
			jchat.put("realty_no", chat.getRealty_no());
			jchat.put("message_count", chat.getMessage_count());
			
			jarr.add(jchat);
			
		}
		sendObj.put("clist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();
	
	} 
	
	@RequestMapping("cmlist.do")
	public void listMessage(HttpServletResponse response, Chat chat) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Message> list = chatService.selectListMessage(chat);
		
		JSONObject sendObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Message message : list) {
			JSONObject jmessage = new JSONObject();
			if(message.getMessage() == null) message.setMessage("");
			if(message.getMessage_image() == null) message.setMessage_image("");
			if(message.getOrigin_filename() == null) message.setOrigin_filename("");
				
			jmessage.put("message_no", message.getMessage_no());
			jmessage.put("message", message.getMessage());
			jmessage.put("message_image", message.getMessage_image());
			jmessage.put("origin_filename", message.getOrigin_filename());
			jmessage.put("renew_filename", message.getRenew_filename());
			jmessage.put("post_time", message.getPost_time());
			jmessage.put("chat_no", message.getChat_no());
			jmessage.put("user_no", message.getUser_no());
			jmessage.put("nickname", message.getNickname());
			jmessage.put("user_profile", message.getUser_profile());
			jmessage.put("read_count", message.getRead_count());
			
			
			jarr.add(jmessage);
			
		}
		sendObj.put("mlist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();
		} 
	
	@RequestMapping("cuserlist.do")
	public void listChatUser(HttpServletResponse response, Chat chat1) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Chat> list = chatService.selectListChatUser(chat1);
		
		JSONObject sendObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Chat chat : list) {
			JSONObject jchat = new JSONObject();
			
			jchat.put("chat_no", chat.getChat_no());
			jchat.put("user_no", chat.getUser_no());
			jchat.put("nickname", chat.getNickname());
			jchat.put("user_profile", chat.getUser_profile());
			jchat.put("check_join", chat.getCheck_join());
			
			jarr.add(jchat);
		}
		
		sendObj.put("culist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();} 
	
	@RequestMapping("cinsert.do")
	@ResponseBody
	public int insertChat(Chat chat, HttpServletRequest request){
		int result = chatService.insertChat(chat);
		chat.setChat_no(result);
		chat.setUser_no(Integer.parseInt(request.getParameter("two_user_no")));
		chatService.insertChat(chat);
		
		return result;
	} 
	
	@RequestMapping("cuserchatinsert.do")
	@ResponseBody
	public int insertUserChat(Chat chat) {
		int result = chatService.insertUserChat(chat);
		return result;
	}
	
	@RequestMapping("ccheck.do")
	@ResponseBody
	public int selectCheckChat(Chat chat){
		Chat result = chatService.selectCheckChat(chat);
		int intresult = 0;
		if(result != null) {
			intresult = result.getChat_no();
		}
		
		return intresult;
	} 
	
	@RequestMapping("cselectuser.do")
	@ResponseBody
	public int selectUserChat(HttpServletRequest request) {
		String nickname = request.getParameter("nickname");
		User result = chatService.selectUserChat(nickname);
		int rresult = 0;
		if(result != null) {
			rresult = result.getUser_no();
		}
		return rresult;
	}
	
	@RequestMapping("chatchatcheck.do")
	@ResponseBody
	public void selectChatChatCheck(Chat chat) {
		Chat chat1 = chatService.selectChatChatCheck(chat);
	}
	
	@RequestMapping("teamchatinsert.do")
	@ResponseBody
	public int insertTeamChat(Chat chat) {
		int result = chatService.insertTeamChat(chat);
		return result;
	}
	
	
	@RequestMapping("cdelete.do")
	@ResponseBody
	public void deleteChat(Chat chat){
		int result = chatService.deleteChat(chat);
	} 
	
	@RequestMapping("cupdatejoin.do")
	public String updateJoin(){return null;} 
	
	@RequestMapping("cupdateaway.do")
	public String updateAway(){return null;} 
	
	@RequestMapping("cupdatealert.do")
	public String updateAlert(){return null;} 
	
	
	// 메세지
	
	@RequestMapping(value="cminsert.do", method=RequestMethod.POST)
	public void insertMessage(HttpServletResponse response, HttpServletRequest request){
		Message message = new Message();
		message.setUser_no(Integer.parseInt(request.getParameter("user_no")));
		message.setChat_no(Integer.parseInt(request.getParameter("chat_no")));
		message.setMessage(request.getParameter("messages"));
		int result = chatService.insertMessage(message);
	} 
	
	@RequestMapping(value="cimginsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void insertMessageImg(MultipartHttpServletRequest request, HttpServletResponse response, @RequestParam(name="message_image") MultipartFile img) throws IllegalStateException, IOException {
		Message message = new Message();
		String savePath = request.getSession().getServletContext().getRealPath("files/chat/chatImages");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renewImage = sdf.format(new Date(System.currentTimeMillis()))+"."+ img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf(".") + 1);
		img.transferTo(new File(savePath + "\\" + renewImage));
		message.setChat_no(Integer.parseInt(request.getParameter("chat_no")));
		message.setUser_no(Integer.parseInt(request.getParameter("user_no")));
		message.setMessage_image(renewImage);
		
		int result = chatService.insertMessageImg(message);
		
	}
	
	@RequestMapping(value="cfileinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void insertMessageFile(MultipartHttpServletRequest request, HttpServletResponse response, @RequestParam(name="orgin_filename") MultipartFile file) throws IllegalStateException, IOException {
		Message message = new Message();
		String savePath = request.getSession().getServletContext().getRealPath("files/chat/chatImages");
		String orginFile = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renewFile = sdf.format(new Date(System.currentTimeMillis()))+"."+ orginFile.substring(orginFile.lastIndexOf(".") + 1);
		file.transferTo(new File(savePath + "\\" + renewFile));
		message.setChat_no(Integer.parseInt(request.getParameter("chat_no")));
		message.setUser_no(Integer.parseInt(request.getParameter("user_no")));
		message.setOrigin_filename(orginFile);
		message.setRenew_filename(renewFile);
		
		int result = chatService.insertMessageFile(message);
		
	}
	
	@RequestMapping("cmdel.do")
	public void deleteMessage(HttpServletResponse response, @RequestParam(name="message_no") int message_no){
		int result = chatService.deleteMessage(message_no);
	} 
	
	
	// 채팅 차단
	@RequestMapping("cblist.do")
	public void mylistChatBlock(HttpServletResponse response, @RequestParam(name="userno") int userno) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<ChatBlock> list = chatService.selectMylistChatBlock(userno);
		
		JSONObject sendObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(ChatBlock chatblock : list) {
			JSONObject jbchat = new JSONObject();
			
			jbchat.put("block_no", chatblock.getBlock_no());
			jbchat.put("block_user", chatblock.getBlock_user());
			jbchat.put("block_time", chatblock.getBlock_time());
			jbchat.put("user_no", chatblock.getUser_no());
			jbchat.put("nickname", chatblock.getNickname());
			jbchat.put("user_profile", chatblock.getUser_profile());
			
			jarr.add(jbchat);
			
		}
		sendObj.put("cblist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();
	} 
	
	@RequestMapping("cbinsert.do")
	@ResponseBody
	public void insertChatBlock(ChatBlock chatBlock){
		int result = chatService.insertChatBlock(chatBlock);
		
	} 
	
	@RequestMapping("cbdel.do")
	@ResponseBody
	public void deleteChatBlock(ChatBlock chatBlock){
		int result = chatService.deleteChatBlock(chatBlock);
	} 
	
	@RequestMapping("cmdownload.do")
	public String filedownload(){return null;}
	
}
