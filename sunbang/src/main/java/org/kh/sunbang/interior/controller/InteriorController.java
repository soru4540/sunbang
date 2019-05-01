package org.kh.sunbang.interior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InteriorController {
	
//-------------------------JB PART------------------------------------------------
	
	@RequestMapping("interiormain.do")
	public String moveInteriorMainView() {
		return "interior/interiorMain";
	}
	
	@RequestMapping("ibinsertview.do")
	public String moveBoardInsertView() {
		return "interior/interiorKnowhowInsert";
	}
	
	@RequestMapping("iblistselect.do")
	public String selectBoardList(@RequestParam(name="board_type") String board_type) {
		
		if(board_type.equals("photograph")) {
		return "interior/interiorPhotographList";
		}else if(board_type.equals("housewarming")) {
			return "interior/interiorHousewarmingList";
		}else {
			return "interior/interiorKnowhowList";
		}
	}
		
	@RequestMapping("islistselect.do")
	public String selectStoryList() {
		return "interior/interiorStoryList";
	}
	
	@RequestMapping("iflistselect.do")
	public String selectFollowList() {
		return "interior/interiorFollowList";
	}
	
	
	
		
//-------------------------SE PART------------------------------------------------	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//-----------------------------------------------------------------------------------	
	
}
