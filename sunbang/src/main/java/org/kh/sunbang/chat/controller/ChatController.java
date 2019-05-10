package org.kh.sunbang.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.kh.sunbang.chat.model.service.ChatService;
import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 채팅방
	@RequestMapping("cmyview.do")
	public String mychatView(){
		return "chat/myChat";}
	
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
	public void listMessage(HttpServletResponse response, @RequestParam(name="chatno") int chatno) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Message> list = chatService.selectListMessage(chatno);
		
		JSONObject sendObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Message message : list) {
			JSONObject jmessage = new JSONObject();
			
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
			
			
			jarr.add(jmessage);
			
		}
		sendObj.put("mlist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();
		} 
	
	@RequestMapping("cinsert.do")
	public String insertChat(){return null;} 
	
	@RequestMapping("cdelete.do")
	public String deleteChat(){return null;} 
	
	@RequestMapping("cupdatejoin.do")
	public String updateJoin(){return null;} 
	
	@RequestMapping("cupdateaway.do")
	public String updateAway(){return null;} 
	
	@RequestMapping("cupdatealert.do")
	public String updateAlert(){return null;} 
	
	
	// 메세지
	
	@RequestMapping("cminsert.do")
	public String insertMessage(){return null;} 
	
	@RequestMapping("cmdel.do")
	public String deleteMessage(){return null;} 
	
	
	// 채팅 차단
	@RequestMapping("cblist.do")
	public ModelAndView mylistChatBlock(){return null;} 
	
	@RequestMapping("cbinsert.do")
	public String insertChatBlock(){return null;} 
	
	@RequestMapping("cbdel.do")
	public String deleteChatBlock(){return null;} 
	
	@RequestMapping("cmdownload.do")
	public String filedownload(){return null;}
	
}
