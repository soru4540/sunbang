package org.kh.sunbang.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("mychatview.do")
	public String loginView(){
		return "chat/myChat";
	}
}
