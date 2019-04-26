package org.kh.sunbang.interior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InteriorController {
	
//-------------------------JB PART------------------------------------------------
	
	@RequestMapping("interiorMain.do")
	public String moveInteriorMainView() {
		return "interior/interiorMain";
	}
	
	@RequestMapping("iboardinsertview.do")
	public String moveBoardInsertView() {
		return "interior/interiorKnowHowInsert";
	}
	
	@RequestMapping("iboardlist.do")
	public String selectBoardList(@RequestParam(name="board_type") String board_type) {
		
		if(board_type.equals("photograph")) {
		return "interior/interiorFilter1";
		}else if(board_type.equals("housewarming")) {
			return "interior/interiorFilter2";
		}else {
			return "interior/interiorFilter3";
		}
	}
		
	@RequestMapping("istoryview.do")
	public String selectStoryList() {
		return "interior/interiorStory";
	}
	
	@RequestMapping("ifollowView.do")
	public String selectFollowList() {
		return "interior/interiorFollow";
	}
	
	
	
		
//-------------------------SE PART------------------------------------------------	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//-----------------------------------------------------------------------------------	
	
}
