package org.kh.sunbang.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	// 채팅방
	@RequestMapping("cmyview.do")
	public String mychatView(){return null;}
	
	@RequestMapping("cfilter.do")
	public ModelAndView listFilterChat(){return null;} 
	
	@RequestMapping("cmyfilter.do")
	public ModelAndView myListFilterChat(){return null;} 
	
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
	@RequestMapping("cmlist.do")
	public ModelAndView listMessage(){return null;} 
	
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
