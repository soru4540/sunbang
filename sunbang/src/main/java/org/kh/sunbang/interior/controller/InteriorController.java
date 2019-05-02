package org.kh.sunbang.interior.controller;

import javax.servlet.http.HttpServletRequest;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Reply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InteriorController {
	
//-------------------------JB PART------------------------------------------------
	
	@RequestMapping("interiormain.do")
	public ModelAndView selectInteriorMain(ModelAndView mv, HttpServletRequest request) {
		
		mv.setViewName("interior/interiorMain");
		return mv;
	}
	
	@RequestMapping("isearch.do")
	public ModelAndView selectInteriorSearch(ModelAndView mv,@RequestParam(name="keyword") String keyword) {
		
		return mv;
	}		
	
	
	
	@RequestMapping("iblistselect.do")
	public ModelAndView selectBoardList(ModelAndView mv, @RequestParam(name="board_type") String board_type) {
		
		
		if(board_type.equals("photograph")) {
		mv.setViewName("interior/interiorPhotographList");
		return mv;
		}else if(board_type.equals("housewarming")) {
			mv.setViewName("interior/interiorHousewarmingList");
			return mv;
		}else {
			mv.setViewName("interior/interiorKnowhowList");
			return mv;
		}
	}
	
	@RequestMapping("ifilter1select.do")
	public ModelAndView selectBoardFilter1List(ModelAndView mv,HttpServletRequest request, @RequestParam(name="board_type") String board_type) {
		
		
		if(board_type.equals("photograph")) {
		mv.setViewName("interior/interiorPhotographList");
		return mv;
		}else if(board_type.equals("housewarming")) {
			mv.setViewName("interior/interiorHousewarmingList");
			return mv;
		}else {
			mv.setViewName("interior/interiorKnowhowList");
			return mv;
		}
	}
	
	@RequestMapping("ifilter2select.do")
	public ModelAndView selectBoardFilter2List(ModelAndView mv,HttpServletRequest request,@RequestParam(name="board_type") String board_type) {
		
		
		if(board_type.equals("photograph")) {
		mv.setViewName("interior/interiorPhotographList");
		return mv;
		}else if(board_type.equals("housewarming")) {
			mv.setViewName("interior/interiorHousewarmingList");
			return mv;
		}else {
			mv.setViewName("interior/interiorKnowhowList");
			return mv;
		}
	}
	
	@RequestMapping("ifilter3select.do")
	public ModelAndView selectBoardFilter3List(ModelAndView mv,HttpServletRequest request,@RequestParam(name="board_type") String board_type) {
		
		
		if(board_type.equals("photograph")) {
		mv.setViewName("interior/interiorPhotographList");
		return mv;
		}else if(board_type.equals("housewarming")) {
			mv.setViewName("interior/interiorHousewarmingList");
			return mv;
		}else {
			mv.setViewName("interior/interiorKnowhowList");
			return mv;
		}
	}
	
	
	
	@RequestMapping("ilinsert.do")
	public void insertLike(Like like) {
			
	}
	
	@RequestMapping("ildelete.do")
	public void deleteLike(Like like) {
		
	}
	
	@RequestMapping("ifinsert.do")
	public void insertFollow(Follow follow) {
			
	}
	
	@RequestMapping("ifdelete.do")
	public void deleteFollow(Follow follow) {
		
	}
	
	@RequestMapping("islistselect.do")
	public ModelAndView selectStoryList(ModelAndView mv,@RequestParam(name="user_no") int user_no) {
		
		mv.setViewName("interior/interiorStoryList");
		return mv;
	}	
	
	@RequestMapping("iflistselect.do")
	public ModelAndView selectFollowList(ModelAndView mv,@RequestParam(name="user_no") int user_no) {
		
		mv.setViewName("interior/interiorFollowList");
		return mv;
	}
	
	@RequestMapping("ifsearch.do")
	public void selectFollowSearch(@RequestParam(name="keyword1") String keyword1) {
		
	}
	
	@RequestMapping("if2search.do")
	public void selectFollowingSearch(@RequestParam(name="keyword2") String keyword2) {
		
	}
	
	@RequestMapping("inlistselect.do")
	public ModelAndView selectNewsFeedList(ModelAndView mv,@RequestParam(name="user_no") int user_no) {
	
		mv.setViewName("interior/interiorNewsFeedList");
		return mv;
	}
	
	
	
		
//-------------------------SE PART------------------------------------------------	
	
	
	@RequestMapping("iwritepage.do")
	public String moveWritePage() {
		
		return "interiorWritePage";
	}
	
	@RequestMapping("ibinsertview.do")
	public ModelAndView moveBoardInsertView(ModelAndView mv){
		
		
			mv.setViewName("interior/interiorPhotographInsert");
		return mv;
	}	
	
	@RequestMapping("ibinsert.do")
	public String insertBoard(HttpServletRequest request){
		
		return "";		
	}	
	
	@RequestMapping("ibupdateview.do")
	public ModelAndView selectBoardUpdateView(ModelAndView mv) {
					
		mv.setViewName("interior/interiorPhotograghUpdate");
		return mv;
	}
	
	@RequestMapping("ibupdate.do")
	public String updateBoard(HttpServletRequest request) {
		
		return "";
	}
	
	@RequestMapping("ibdelete.do")
	public String deleteBoard(HttpServletRequest request) {
		
		return "";
	}
	
	@RequestMapping("ipdelete.do")
	public void deletePost(HttpServletRequest request) {
		
	
	}
	
	@RequestMapping("imdelete.do")
	public void deleteMarker(HttpServletRequest request) {
		
	}		
	
	@RequestMapping("ibselect.do")
	public ModelAndView selectBoard(ModelAndView mv) {
		
		mv.setViewName("interior/interiorPhotograghDetail");
		return mv;
	}	
	
	@RequestMapping("irinsert.do")
	public void insertReply(Reply reply) {
		
	}
	
	@RequestMapping("irupdate.do")
	public void updateReply(Reply reply) {
		
	}
	
	@RequestMapping("irdelete.do")
	public void deleteReply(Reply reply) {
		
	}	

		
	
//-----------------------------------------------------------------------------------	
	
	
}
