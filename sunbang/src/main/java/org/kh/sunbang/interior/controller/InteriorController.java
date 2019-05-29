package org.kh.sunbang.interior.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.service.InteriorService;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.FollowFull;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.kh.sunbang.interior.model.vo.ReplyFull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;

@Controller
public class InteriorController {
	
   @Autowired
   private InteriorService interiorService;
	
//-------------------------JB PART------------------------------------------------
   //인테리어메인 이동 및 출력
   @RequestMapping(value="itop5.do", produces="application/json")
	public @ResponseBody List<BoardFull> selectInteriorTop5(HttpSession session) throws ParseException{
		ArrayList<BoardFull> iblist = interiorService.selectInteriorTop5();
		session.setAttribute("iblist", iblist);
	    return iblist;
	}
   
   
   //인테리어메인 이동 및 출력
  	@RequestMapping("interiormain.do")
  	public ModelAndView selectInteriorMain(ModelAndView mv) {
  		BoardFull hbtop1 = interiorService.selectHbTop1();
  		ArrayList<BoardFull> kbtop4 = interiorService.selectKbTop4();
  		ArrayList<BoardFull> hbtop3 = interiorService.selectHbTop3();
  		ArrayList<BoardFull> pbtop8 = interiorService.selectPbTop8();
  		
  		mv.addObject("hbtop1", hbtop1);
  		mv.addObject("kbtop4", kbtop4);
  		mv.addObject("hbtop3", hbtop3);
  		mv.addObject("pbtop8", pbtop8);
  		mv.setViewName("interior/interiorMain");
  		return mv;
  	}
  		
  	
      //인테리어 검색	
  	@RequestMapping("isearch.do")
  	public ModelAndView selectInteriorSearch(ModelAndView mv,@RequestParam(name="keyword") String keyword) {
  		
  		if(keyword.equals("사진") || keyword.equals("photograph")) {		
  		 mv.setViewName("interior/interiorPhotographList");
  		 return mv;
  		}else if(keyword.equals("집들이") || keyword.equals("housewarming")) {			
  		 mv.setViewName("interior/interiorHousewarmingList");
  		 return mv;
  		}else if(keyword.equals("노하우") || keyword.equals("knowhow")){			
  		 mv.setViewName("interior/interiorKnowhowList");
  		 return mv;
  		}else {
  		mv.addObject("keyword", keyword);
  		mv.setViewName("interior/interiorSearchList");
  		}
  		return mv;
  	}		
  	
  	
  	//인테리어 검색 리스트 출력 
  	@RequestMapping(value = "isearchselect.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectSearchList(Ipaging ipaging, HttpServletResponse response) {  
  		JSONArray jarray = new JSONArray();
  		JSONArray jarray2 = new JSONArray();
  		JSONObject sendObj = new JSONObject();
  		try {
  			int total_num = interiorService.selectSearchListCount(ipaging.getKeyword1()); // 데이터의 전체 갯수를 가져온다.
  			
  			ArrayList<BoardFull> iblist = interiorService.selectSearchList(ipaging.getKeyword1()); // 조회한 데이터를 가져온다.
  			for (BoardFull boardfull : iblist) {
  				// BoardFull 객체 저장용 json 객체를 생성
  				JSONObject jboardfull = new JSONObject();
  				jboardfull.put("board_no", boardfull.getBoard_no());
  				jboardfull.put("board_title", boardfull.getBoard_title());
  				jboardfull.put("board_type", boardfull.getBoard_type());
  				jboardfull.put("board_hits", boardfull.getBoard_hits());
  				jboardfull.put("post_no", boardfull.getPost_no());
  				jboardfull.put("post_keyword", boardfull.getPost_keyword());
  				jboardfull.put("post_data", boardfull.getPost_data());
  				jboardfull.put("user_no", boardfull.getUser_no());
  				jboardfull.put("nickname", boardfull.getNickname());
  				jboardfull.put("user_profile", boardfull.getUser_profile());
  				jboardfull.put("like_count", boardfull.getLike_count());
  				jboardfull.put("follow_count", boardfull.getFollow_count());
  				// jarray에 jboardfull 저장
  				jarray.add(jboardfull);
  			}
  			ArrayList<Like> illist = interiorService.selectLikeCheck(ipaging.getUser_no());
  			for (Like like : illist) {
  				JSONObject jlike = new JSONObject();
  				jlike.put("like_no", like.getLike_no());
  				jlike.put("user_no", like.getUser_no());
  				jlike.put("board_no", like.getBoard_no());
  				// jarray2에 jlike 저장
  				jarray2.add(jlike);
  			}
  			sendObj.put("iblist", jarray);
  			sendObj.put("illist", jarray2);			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return sendObj.toJSONString();
  	}
  		
  	//인테리어 게시판(사진,집들이,노하우)으로 이동 및 출력
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
  	
  	//인테리어 사진 게시판 리스트 페이징처리 & 필터검색 
  		@RequestMapping(value = "ifilter1select.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  		@ResponseBody
  		public String selectBoardFilter1List(Ipaging ipaging, HttpServletResponse response) {  
  			
  			JSONArray jarray = new JSONArray();
  			JSONArray jarray2 = new JSONArray();
  			JSONObject sendObj = new JSONObject();
  			try {
  				int total_num = interiorService.selectListCount(ipaging.getBoard_type()); // 데이터의 전체 갯수를 가져온다.
  				int page = ipaging.getPage();
  				if (page == 1) {
  					ipaging.setStart_num(1);  				
  						ipaging.setEnd_num(16);
  				} else {
  					ipaging.setStart_num(page + ((7 * page) + 1)); // 17 25 33 
  					ipaging.setEnd_num(8 + (page * 8)); // 24 32 40
  					if (ipaging.getEnd_num() >= total_num) {
  						ipaging.setEnd_num(total_num);
  					}
  				}	
  				ArrayList<BoardFull> iblist = interiorService.selectBoardList(ipaging); // 조회한 데이터를 가져온다.
  				for (BoardFull boardfull : iblist) {
  					// BoardFull 객체 저장용 json 객체를 생성
  					JSONObject jboardfull = new JSONObject();
  					jboardfull.put("board_no", boardfull.getBoard_no());
  					jboardfull.put("board_title", boardfull.getBoard_title());
  					jboardfull.put("board_type", boardfull.getBoard_type());
  					jboardfull.put("board_hits", boardfull.getBoard_hits());
  					jboardfull.put("post_no", boardfull.getPost_no());
  					jboardfull.put("post_keyword", boardfull.getPost_keyword());
  					jboardfull.put("post_data", boardfull.getPost_data());
  					jboardfull.put("user_no", boardfull.getUser_no());
  					jboardfull.put("nickname", boardfull.getNickname());
  					jboardfull.put("user_profile", boardfull.getUser_profile());
  					jboardfull.put("like_count", boardfull.getLike_count());
  					// jarray에 jboardfull 저장
  					jarray.add(jboardfull);
  				}
  				ArrayList<Like> illist = interiorService.selectLikeCheck(ipaging.getUser_no());
  				for (Like like : illist) {
  					JSONObject jlike = new JSONObject();
  					jlike.put("like_no", like.getLike_no());
  					jlike.put("user_no", like.getUser_no());
  					jlike.put("board_no", like.getBoard_no());
  					// jarray2에 jlike 저장
  					jarray2.add(jlike);
  				}
  				sendObj.put("iblist", jarray);
  				sendObj.put("illist", jarray2);
  				sendObj.put("total_num", total_num);
  				sendObj.put("start_num", ipaging.getStart_num());
  				sendObj.put("end_num", ipaging.getEnd_num());
  			} catch (Exception e) {
  				e.printStackTrace();
  			}

  			return sendObj.toJSONString();
  		}
  	
  	//인테리어 집들이 게시판 리스트 페이징처리 & 필터검색 
  	@RequestMapping(value = "ifilter2select.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody	
  	public String selectBoardFilter2List(Ipaging ipaging, HttpServletResponse response) {
  		JSONArray jarray = new JSONArray();		
  		JSONObject sendObj = new JSONObject();
  		try {
  			int total_num = interiorService.selectListCount(ipaging.getBoard_type()); // 데이터의 전체 갯수를 가져온다.
  			int page = ipaging.getPage();
  			if (page == 1) {
  				ipaging.setStart_num(1);  				
  					ipaging.setEnd_num(12);
  			} else {
  				ipaging.setStart_num((page * 6)+1); // 13 19 25 
  				ipaging.setEnd_num(((page + 1)* 6)); // 18 24 30
  				if (ipaging.getEnd_num() >= total_num) {
  					ipaging.setEnd_num(total_num);
  				}
  			}	
  			ArrayList<BoardFull> iblist = interiorService.selectBoardList(ipaging); // 조회한 데이터를 가져온다.
  			for (BoardFull boardfull : iblist) {
  				// BoardFull 객체 저장용 json 객체를 생성
  				JSONObject jboardfull = new JSONObject();
  				jboardfull.put("board_no", boardfull.getBoard_no());
  				jboardfull.put("board_title", boardfull.getBoard_title());
  				jboardfull.put("board_type", boardfull.getBoard_type());
  				jboardfull.put("board_hits", boardfull.getBoard_hits());
  				jboardfull.put("post_no", boardfull.getPost_no());
  				jboardfull.put("post_keyword", boardfull.getPost_keyword());
  				jboardfull.put("post_data", boardfull.getPost_data());
  				jboardfull.put("user_no", boardfull.getUser_no());
  				jboardfull.put("nickname", boardfull.getNickname());
  				jboardfull.put("user_profile", boardfull.getUser_profile());
  				jboardfull.put("like_count", boardfull.getLike_count());
  				// jarray에 jboardfull 저장
  				jarray.add(jboardfull);
  			}		
  			sendObj.put("iblist", jarray);	
  			sendObj.put("total_num", total_num);
  			sendObj.put("start_num", ipaging.getStart_num());
  			sendObj.put("end_num", ipaging.getEnd_num());
  		} catch (Exception e) {
  			e.printStackTrace();
  		}

  		return sendObj.toJSONString();
  	}
  	
  	//인테리어 노하우 게시판 리스트 페이징처리 & 필터검색 
  	@RequestMapping(value = "ifilter3select.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody	
  	public String selectBoardFilter3List(Ipaging ipaging, HttpServletResponse response) {
  		JSONArray jarray = new JSONArray();		
  		JSONObject sendObj = new JSONObject();
  		try {
  			int total_num = interiorService.selectListCount(ipaging.getBoard_type()); // 데이터의 전체 갯수를 가져온다.
  			int page = ipaging.getPage();
  			if (page == 1) {
  				ipaging.setStart_num(1);  				
  					ipaging.setEnd_num(12);
  			} else {
  				ipaging.setStart_num((page * 6)+1); // 13 19 25 
  				ipaging.setEnd_num(((page + 1)* 6)); // 18 24 30
  				if (ipaging.getEnd_num() >= total_num) {
  					ipaging.setEnd_num(total_num);
  				}
  			}	  		
  			ArrayList<BoardFull> iblist = interiorService.selectBoardList(ipaging); // 조회한 데이터를 가져온다.
  			for (BoardFull boardfull : iblist) {
  				// BoardFull 객체 저장용 json 객체를 생성
  				JSONObject jboardfull = new JSONObject();
  				jboardfull.put("board_no", boardfull.getBoard_no());
  				jboardfull.put("board_title", boardfull.getBoard_title());
  				jboardfull.put("board_type", boardfull.getBoard_type());
  				jboardfull.put("board_hits", boardfull.getBoard_hits());
  				jboardfull.put("post_no", boardfull.getPost_no());
  				jboardfull.put("post_keyword", boardfull.getPost_keyword());
  				jboardfull.put("post_data", boardfull.getPost_data());
  				jboardfull.put("user_no", boardfull.getUser_no());
  				jboardfull.put("nickname", boardfull.getNickname());
  				jboardfull.put("user_profile", boardfull.getUser_profile());
  				jboardfull.put("like_count", boardfull.getLike_count());
  				// jarray에 jboardfull 저장
  				jarray.add(jboardfull);
  			}		
  			sendObj.put("iblist", jarray);	
  			sendObj.put("total_num", total_num);
  			sendObj.put("start_num", ipaging.getStart_num());
  			sendObj.put("end_num", ipaging.getEnd_num());
  		} catch (Exception e) {
  			e.printStackTrace();
  		}

  		return sendObj.toJSONString();
  	}
    
  	
  	//좋아요 등록
  	@RequestMapping(value="ilinsert.do",method = RequestMethod.POST)
  	public void insertLike(Like like,HttpServletResponse response) {
  	
  		int result = interiorService.insertLike(like);
  	    PrintWriter out = null;	   
  		try {
  			out = response.getWriter();
  			if(result == 1){
  			out.append("ok");	
  			}else {
  				out.append("fail");		
  			}		
  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}finally {
  			out.flush();
  			out.close();
  		}		
  	}
  	
  	//좋아요 삭제
  	@RequestMapping(value="ildelete.do",method = RequestMethod.POST)	
  	public void deleteLike(Like like,HttpServletResponse response) {

  		int result = interiorService.deleteLike(like);
  	    PrintWriter out = null;
  			try {
  				out = response.getWriter();
  				if(result == 1){
  				out.append("ok");	
  				}else {
  					out.append("fail");		
  				}		
  			} catch (IOException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}finally {
  				out.flush();
  				out.close();
  			}		
  	}
  	
  	//팔로우 추가
  	@RequestMapping(value="ifinsert.do", method = RequestMethod.POST)
  	@ResponseBody
  	public int insertFollow(Follow follow, HttpServletResponse response) { 	
  		int result = interiorService.insertFollow(follow); 
  	return result;
  	}
  	
  	//팔로우 삭제
  	@RequestMapping(value="ifdelete.do", method = RequestMethod.POST)
  	@ResponseBody
  	public int deleteFollow(Follow follow, HttpServletResponse response) {
  		int result = interiorService.deleteFollow(follow); 
  	 	return result;
  	}
  	
  	//스토리 페이지로 이동
  	@RequestMapping("istory.do")
  	public ModelAndView moveStoryList(ModelAndView mv,Follow follow) {		 	
  		FollowFull fuser= interiorService.selectUserFollowFollowing(follow.getFollower_no());
  		int result = interiorService.selectCheckFollow(follow);
  		mv.addObject("fuser", fuser);
  		mv.addObject("checkfollow", result);
  		mv.addObject("follower_no",follow.getFollower_no());
  		mv.setViewName("interior/interiorStoryList");
  		return mv;	
  	}
  	
  	//스토리 리스트 출력
  	@RequestMapping(value="islistselect.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectStoryList(Ipaging ipaging, HttpServletResponse response) {		
            JSONArray jarray = new JSONArray();
  			JSONArray jarray2 = new JSONArray();
  			JSONObject sendObj = new JSONObject();  		 
  			try {
  				int total_num = interiorService.selectStoryListCount(ipaging); // 데이터의 전체 갯수를 가져온다.
  				int page = ipaging.getPage();
  				if (page == 1) {
  					ipaging.setStart_num(1);  					
  					ipaging.setEnd_num(12);
  				} else {
  					ipaging.setStart_num((page * 6)+1); // 13 19 25 
  					ipaging.setEnd_num(((page + 1)* 6)); // 18 24 30
  					if (ipaging.getEnd_num() >= total_num) {
  						ipaging.setEnd_num(total_num);
  					}
  				}	  			
  				ArrayList<BoardFull> iblist = interiorService.selectStoryList(ipaging); // 조회한 데이터를 가져온다.  			
  				for (BoardFull boardfull : iblist) {
  					// BoardFull 객체 저장용 json 객체를 생성
  					JSONObject jboardfull = new JSONObject();
  					jboardfull.put("board_no", boardfull.getBoard_no());
  					jboardfull.put("board_title", boardfull.getBoard_title());
  					jboardfull.put("board_type", boardfull.getBoard_type());
  					jboardfull.put("board_hits", boardfull.getBoard_hits());
  					jboardfull.put("post_no", boardfull.getPost_no());
  					jboardfull.put("post_keyword", boardfull.getPost_keyword());
  					jboardfull.put("post_data", boardfull.getPost_data());
  					jboardfull.put("user_no", boardfull.getUser_no());
  					jboardfull.put("nickname", boardfull.getNickname());
  					jboardfull.put("user_profile", boardfull.getUser_profile());
  					jboardfull.put("like_count", boardfull.getLike_count());
  					// jarray에 jboardfull 저장
  					jarray.add(jboardfull);
  				}
  				ArrayList<Like> illist = interiorService.selectLikeCheck(ipaging.getUser_no());
  				for (Like like : illist) {
  					JSONObject jlike = new JSONObject();
  					jlike.put("like_no", like.getLike_no());
  					jlike.put("user_no", like.getUser_no());
  					jlike.put("board_no", like.getBoard_no());
  					// jarray2에 jlike 저장
  					jarray2.add(jlike);
  				}
  				sendObj.put("iblist", jarray);
  				sendObj.put("illist", jarray2);
  				sendObj.put("total_num", total_num);
  				sendObj.put("start_num", ipaging.getStart_num());
  				sendObj.put("end_num", ipaging.getEnd_num());
  			} catch (Exception e) {
  				e.printStackTrace();
  			}

  			return sendObj.toJSONString();
  		}
  	
  	@RequestMapping("ifollowlist.do")
  	public ModelAndView moveFollowList(ModelAndView mv,@RequestParam(name="user_no") int user_no) {		 	 	
  		FollowFull fuser= interiorService.selectUserFollowFollowing(user_no);
  		mv.addObject("fuser",fuser);
  		mv.setViewName("interior/interiorFollowList");
  		return mv;	
  	}  	  	
  	
  	//유저 팔로우 리스트 출력
  	@RequestMapping(value="ifsearch.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectFollowSearch(FollowFull followfull, HttpServletResponse response) {
  		ArrayList<FollowFull> followlist = interiorService.selectFollowList(followfull);
  		JSONArray jarray = new JSONArray();		
  		JSONObject sendObj = new JSONObject();	
  		try {		
  			for (FollowFull ffull : followlist) {	
  				// FollowFull 객체 저장용 json 객체를 생성
  				JSONObject jfollowfull = new JSONObject();
  				jfollowfull.put("follow_no", ffull.getFollow_no());
  				jfollowfull.put("follower_no", ffull.getFollower_no());
  				jfollowfull.put("user_no", ffull.getUser_no());
  				jfollowfull.put("user_profile", ffull.getUser_profile());
  				jfollowfull.put("user_id", ffull.getUser_id());
  				jfollowfull.put("nickname", ffull.getNickname());
  				jfollowfull.put("user_name", ffull.getUser_name());		
  				// jarray에 jfollowfull 저장
  				jarray.add(jfollowfull);
  			}
  			sendObj.put("followlist", jarray);
  		} catch (Exception e) {
  			// TODO: handle exception
  		}
  		
  		return sendObj.toJSONString();
  	}
  	
  	//유저 팔로잉 리스트 출력
  	@RequestMapping(value="if2search.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectFollowingSearch(FollowFull followfull, HttpServletResponse response) {
  	    ArrayList<FollowFull> followinglist = interiorService.selectFollowingList(followfull);
  		JSONArray jarray = new JSONArray();		
  		JSONObject sendObj = new JSONObject();		
  		try {		
  			for (FollowFull ffull : followinglist) {	
  				// FollowFull 객체 저장용 json 객체를 생성
  				JSONObject jfollowfull = new JSONObject();
  				jfollowfull.put("follow_no", ffull.getFollow_no());
  				jfollowfull.put("follower_no", ffull.getFollower_no());
  				jfollowfull.put("user_no", ffull.getUser_no());
  				jfollowfull.put("user_profile", ffull.getUser_profile());
  				jfollowfull.put("user_id", ffull.getUser_id());
  				jfollowfull.put("nickname", ffull.getNickname());
  				jfollowfull.put("user_name", ffull.getUser_name());		
  				// jarray에 jfollowfull 저장
  				jarray.add(jfollowfull);
  			}
  			sendObj.put("followinglist", jarray);
  		} catch (Exception e) {
  			// TODO: handle exception
  		}
  		
  		return sendObj.toJSONString();
  	}
  	
  	@RequestMapping("inewsfeed.do")
  	public ModelAndView moveNewsFeedList(ModelAndView mv,@RequestParam(name="user_no") int user_no) {	
  		FollowFull fuser= interiorService.selectUserFollowFollowing(user_no);
  		mv.addObject("fuser",fuser);
  		mv.setViewName("interior/interiorNewsFeedList");
  		return mv;	
  	}
  	
  	//뉴스피드 리스트 출력
  	@RequestMapping(value="inlistselect.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectNewsFeedList(Ipaging ipaging, HttpServletResponse response) { 		 	 
  	            JSONArray jarray = new JSONArray();
  	 			JSONArray jarray2 = new JSONArray();
  	 			JSONObject sendObj = new JSONObject();  	 			
  	 			try {
  	 				int total_num = interiorService.selectNewsFeedListCount(ipaging); // 데이터의 전체 갯수를 가져온다.
  	 				int page = ipaging.getPage();
  	 				if (page == 1) {
  	 					ipaging.setStart_num(1);  	 					
  	 					ipaging.setEnd_num(12);
  	 				} else {
  	 					ipaging.setStart_num((page * 6)+1); // 13 19 25 
  	 					ipaging.setEnd_num(((page + 1)* 6)); // 18 24 30
  	 					if (ipaging.getEnd_num() >= total_num) {
  	 						ipaging.setEnd_num(total_num);
  	 					}
  	 				}	
  	 				ArrayList<BoardFull> iblist = interiorService.selectNewsFeedList(ipaging); // 조회한 데이터를 가져온다.
  	 				for (BoardFull boardfull : iblist) {
  	 					// BoardFull 객체 저장용 json 객체를 생성
  	 					JSONObject jboardfull = new JSONObject();
  	 					jboardfull.put("board_no", boardfull.getBoard_no());
  	 					jboardfull.put("board_title", boardfull.getBoard_title());
  	 					jboardfull.put("board_type", boardfull.getBoard_type());
  	 					jboardfull.put("board_hits", boardfull.getBoard_hits());
  	 					jboardfull.put("post_no", boardfull.getPost_no());
  	 					jboardfull.put("post_keyword", boardfull.getPost_keyword());
  	 					jboardfull.put("post_data", boardfull.getPost_data());
  	 					jboardfull.put("user_no", boardfull.getUser_no());
  	 					jboardfull.put("user_id", boardfull.getUser_id());
  	 					jboardfull.put("nickname", boardfull.getNickname());
  	 					jboardfull.put("user_profile", boardfull.getUser_profile());
  	 					jboardfull.put("like_count", boardfull.getLike_count());
  	 					// jarray에 jboardfull 저장
  	 					jarray.add(jboardfull);
  	 				}
  	 				ArrayList<Like> illist = interiorService.selectLikeCheck(ipaging.getUser_no());
  	 				for (Like like : illist) {
  	 					JSONObject jlike = new JSONObject();
  	 					jlike.put("like_no", like.getLike_no());
  	 					jlike.put("user_no", like.getUser_no());
  	 					jlike.put("board_no", like.getBoard_no());
  	 					// jarray2에 jlike 저장
  	 					jarray2.add(jlike);
  	 				}
  	 				sendObj.put("iblist", jarray);
  	 				sendObj.put("illist", jarray2);
  	 				sendObj.put("total_num", total_num);
  	 				sendObj.put("start_num", ipaging.getStart_num());
  	 				sendObj.put("end_num", ipaging.getEnd_num());
  	 			} catch (Exception e) {
  	 				e.printStackTrace();
  	 			}

  	 			return sendObj.toJSONString();
  	 		}
  	
  	//게시판등록-노하우버전
  	@RequestMapping(value="ibinsert.do", method=RequestMethod.POST)
  	public String insertBoard(Board board, MultipartHttpServletRequest mrequest){			
  	    //게시판 등록
  		int resultboard = interiorService.insertBoard(board);	
  		//게시판번호 가져오기
  	    int board_no = interiorService.selectBoardNo(board.getUser_no());
       //게시물 키워드 배열로 받기	    
  	    String[] post_keyword= mrequest.getParameterValues("post_keyword");
  	    int resultpost=0;
  	    String savePath = mrequest.getSession().getServletContext().getRealPath("files/interior/interiorBoard");
  	    //전달 받은 게시물만큼 등록 for문	    
  	    for(int i=0; i<post_keyword.length;i++) {
  	    	//해당 순번에 게시물이 없거나 post_keyword가 입력되지 않았을 경우 다음 순번이 실행
  	    	if(!post_keyword[i].equals("empty")){
  	    	//게시물 객체 생성
  	    	Post post = new Post();
  	    	//게시판번호 set
  	    	post.setBoard_no(board_no);
  	    	//게시물 키워드 set
  	    	post.setPost_keyword(post_keyword[i]);	    		    
  	    	//게시물 키워드에 따른 게시물 데이터와 게시물 내용 set
  	    	//게시물 키워드 커버일 때
  	
  	        if(post_keyword[i].equals("cover")) {	        	
  				MultipartFile mf = mrequest.getFile("post_data" + i);
  				String originalFilename = mf.getOriginalFilename();
  				long fileSize = mf.getSize();
  				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  				try {
  					if (originalFilename != "" && fileSize != 0) {
  						mf.transferTo(new File(saveFile));
  						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  					}
  				} catch (IllegalStateException e) {
  					e.printStackTrace();
  				} catch (IOException e) {
  					e.printStackTrace();
  				}
  				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	        
  	        //게시물 키워드 소제목일 때
  	        }else if(post_keyword[i].equals("strapline")){	        	
  	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	        //게시물 키워드 텍스트일 때	
  	        }else if(post_keyword[i].equals("text")){	        	
  	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	        //게시물 키워드 사진일 때	
  	        }else if(post_keyword[i].equals("photo")){
  				MultipartFile mf = mrequest.getFile("post_data" + i);
  				String originalFilename = mf.getOriginalFilename();
  				long fileSize = mf.getSize();
  				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  				try {
  					if (originalFilename != "" && fileSize != 0) {
  						mf.transferTo(new File(saveFile));
  						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  					}
  				} catch (IllegalStateException e) {
  					e.printStackTrace();
  				} catch (IOException e) {
  					e.printStackTrace();
  				}
  				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	        //게시물 키워드 동영상일 때	
  	        }else if(post_keyword[i].equals("video")){
  	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	        //게시물 키워드 버튼일 때	
  	        }else if(post_keyword[i].equals("button")){
  	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
           //게시물 키워드 구분선일 때
  	        }else if(post_keyword[i].equals("divisionline")){
  	        	post.setPost_data(mrequest.getParameter("post_data"+i));	        	
  	        }
  	        
  	        resultpost += interiorService.insertPost(post);
  	    	}
  	    }
  			
  	    //게시판상세뷰 매핑으로
  		return "redirect:ibselect.do?board_no="+board_no+"&board_type="+board.getBoard_type();		
  	}	
  	
  	
  	//댓글 등록
  	@RequestMapping(value="irinsert.do",method = RequestMethod.POST)
  	@ResponseBody
  	public int insertReply(Reply reply) {
  	int result = interiorService.insertReply(reply);
  	int board_no=0; 
  	if(result == 1) {
  		board_no = reply.getBoard_no();
  	}else {
  		board_no = 0;
  	}
  	return board_no;	
  	}
  	
  	//댓글 수정
  	@RequestMapping(value="irupdate.do",method = RequestMethod.POST)
  	@ResponseBody
  	public int updateReply(Reply reply) {
  	int result = interiorService.updateReply(reply);
  	
  	int board_no=0; 
  	if(result == 1) {
  		board_no = reply.getBoard_no();
  	}else {
  		board_no = 0;
  	}
  	return board_no;
  	}
  	
  	//댓글 삭제
  	@RequestMapping(value="irdelete.do",method = RequestMethod.POST)
  	@ResponseBody
  	public int deleteReply(Reply reply) {
  	int result = interiorService.deleteReply(reply.getReply_no());
  	int board_no=0; 
  	if(result == 1) {
  		board_no = reply.getBoard_no();
  	}else {
  		board_no = 0;
  	}
  	return board_no;
  	}
  	
  	//댓글 리스트 출력
  	@RequestMapping(value="irlist.do",method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  	@ResponseBody
  	public String selectReplyList(@RequestParam(name="board_no") int board_no) {	
  		JSONArray jarray = new JSONArray();
  		JSONObject sendObj = new JSONObject();
  		try {
  		ArrayList<ReplyFull> irlist= interiorService.selectReplyList(board_no);
  		for(ReplyFull replyfull : irlist) {
  			JSONObject jreplyfull = new JSONObject();				
  			jreplyfull.put("reply_no", replyfull.getReply_no());
  			jreplyfull.put("reply_lev", replyfull.getReply_lev());
  			jreplyfull.put("origin_reply_no", replyfull.getOrigin_reply_no());
  			jreplyfull.put("reply_contents", replyfull.getReply_contents());
  			jreplyfull.put("board_no", replyfull.getBoard_no());
  			jreplyfull.put("user_no", replyfull.getUser_no());
  			jreplyfull.put("user_profile", replyfull.getUser_profile());
  			jreplyfull.put("user_id", replyfull.getUser_id());
  			jreplyfull.put("nickname", replyfull.getNickname());
  			jreplyfull.put("user_name", replyfull.getUser_name());
  			jreplyfull.put("re_reply_no", replyfull.getRe_reply_no());
  			jreplyfull.put("re_user_no", replyfull.getRe_user_no());
  			jreplyfull.put("re_user_profile", replyfull.getRe_user_profile());
  			jreplyfull.put("re_user_id", replyfull.getRe_user_id());
  			jreplyfull.put("re_nickname", replyfull.getRe_nickname());
  			jreplyfull.put("re_user_name", replyfull.getRe_user_name());
  			jarray.add(jreplyfull);			
  		}
  		}catch (Exception e) {
  			e.printStackTrace();
  		}
  		sendObj.put("irlist", jarray);			
  		return sendObj.toJSONString();
  	}	
  	
  	    //인테리어 유저 신고
  	 	@RequestMapping(value="ireportinsert.do",method = RequestMethod.POST)
  	 	@ResponseBody
  	 	public int insertInteriorUserReport(Report report) {
  	 	     int result = interiorService.insertReport(report);
  	 		return result;
  	 	}
  	 	 	
  	 	
  	 	   //게시판수정-노하우버전
  	 	  @RequestMapping(value="ibupdate.do",method = RequestMethod.POST)
  		  public String updateBoard(Board board, MultipartHttpServletRequest mrequest) {
  	 		//경고받은 게시판 수정일 경우
  	 		if(board.getBoard_status()==1) {
  	 		//경고 후 수정 상태인 2로 변경
  	 			board.setBoard_status(2);
  	 		}
  	 		//게시판 수정
  	 		int resultboard = interiorService.updateBoard(board);	
  	 		
  	 		//게시물번호 받아오기
  	 		String[] s_post_no = mrequest.getParameterValues("post_no"); 	 		
  	 		//게시물번호 int형 배열로 받을 준비
  	 		int[] post_no = new int[s_post_no.length];
  	 	   //게시물 번호 인트타입으로 변형 
  	 		for(int i=0; i<post_no.length;i++) {        
  	 	   post_no[i]=Integer.parseInt(s_post_no[i]);          
  	 		}
  	 		//게시물의 기존 키워드 받은 배열
  	 		String[] hidden_post_keyword= mrequest.getParameterValues("hidden_post_keyword");
  	 	    //게시물의 새로운 키워드 받은 배열
  	 		String[] post_keyword= mrequest.getParameterValues("post_keyword");
       
  	 	   //게시물 insert 혹은 update 완료 count 변수
             int resultpost=0;
              //파일 저장경로
      	    String savePath = mrequest.getSession().getServletContext().getRealPath("files/interior/interiorBoard");
             
      	    //게시물번호 만큼 for문 (중간에 삭제되거나 데이터를 입력하지 않은 게시물은 insert나 update 하지않고 다음 index로 넘어감)
  	 		for(int i=0;i<post_no.length;i++) {
  	 		   	//게시물 객체 생성 	 	
  	 			Post post = new Post();
  	 			//게시판번호 set
  	 	    	post.setBoard_no(board.getBoard_no());
  	 	        //게시물번호 set
  	 	    	post.setPost_no(post_no[i]);
  	 	    	//불러온 이전 게시물 상태에서 변경하거나 그대로 둔 경우 
  	 			if(!hidden_post_keyword[i].equals("empty")&&post_keyword[i].equals("empty")){
  	 			       //게시물 키워드 set
  	 	 	    	   post.setPost_keyword(hidden_post_keyword[i]);	
  	 	 	    	    //게시물이 커버일 경우
  	 				    if(hidden_post_keyword[i].equals("cover")) { 	 	 	    	    	
  	 	    	    	if(mrequest.getParameter("origin_post"+i).equals("empty")) {	 	    	    
  	 	    	    	MultipartFile mf = mrequest.getFile("post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	 				//새롭게 등록된 파일의 경우 이전 파일 폴더에서 삭제
  	 	 				(new File(savePath+"\\"+mrequest.getParameter("origin_post_data"+i))).delete();
  	 	    	    	}else {
  	 	    	    	post.setPost_data(mrequest.getParameter("origin_post_data"+i));
  	 	    	    	post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	    	    	} 	 	    	
  	 	    	    //게시물이 소제목일 경우	
  	 	    	    }else if(hidden_post_keyword[i].equals("strapline")) {
  	 	    	    	post.setPost_contents(mrequest.getParameter("hidden_post_contents"+i));
  	 	    	    //게시물이 텍스트일 경우
  	 	    	    }else if(hidden_post_keyword[i].equals("text")) {
  	 	    	    	post.setPost_contents(mrequest.getParameter("hidden_post_contents"+i));
  	 	    	    //게시물이 사진일 경우
  	 	    	    }else if(hidden_post_keyword[i].equals("photo")) { 	 	    	    	
  	 	    	  	if(mrequest.getParameter("origin_post"+i).equals("empty")) {	 	    	    
  	 	    	    	MultipartFile mf = mrequest.getFile("hidden_post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("hidden_post_contents" + i));
  	 	 			   //새롭게 등록된 파일의 경우 이전 파일 폴더에서 삭제
  	 	 				(new File(savePath+"\\"+mrequest.getParameter("origin_post_data"+i))).delete();
  	 	    	    	}else {
  	 	    	    	post.setPost_data(mrequest.getParameter("origin_post_data"+i));
  	 	    	    	post.setPost_contents(mrequest.getParameter("hidden_post_contents" + i));
  	 	    	    	} 	 	    	  	 	    	  	
  	 	    	   //게시물이 동영상일 경우
  	 	    	    }else if(hidden_post_keyword[i].equals("video")) {
  	 	    	    	post.setPost_data(mrequest.getParameter("hidden_post_data"+i));
  	 	    	    	post.setPost_contents(mrequest.getParameter("hidden_post_contents"+i));
  	 	    	    //게시물이 버튼일 경우
  	 	    	    }else if(hidden_post_keyword[i].equals("button")) {
  	 	    	    	post.setPost_data(mrequest.getParameter("hidden_post_data"+i));
  	 	    	    	post.setPost_contents(mrequest.getParameter("hidden_post_contents"+i));
  	 	    	    //게시물이 구분선일 경우 	
  	 	    	    }else if(hidden_post_keyword[i].equals("divisionline")) {
  	 	    	    	post.setPost_data(mrequest.getParameter("hidden_post_data"+i)); 	 	    	    	 	 	    	    	
  	 	    	    } 	 	    
  	 				 //게시물 수정   
  	 	    		 resultpost += interiorService.updatePost(post); 	 	    
  	 			}
  	 			
  	 			//불러온 이전 게시물 상태가 아닌 새로운 타입에서 변경한 경우
  	 			if(!hidden_post_keyword[i].equals("empty")&&!post_keyword[i].equals("empty")){
  	 			    //게시물 키워드 set
  	 	 	    	post.setPost_keyword(post_keyword[i]);	  
  	 	 	      //게시물이 커버일 경우
  	 			     if(post_keyword[i].equals("cover")) {	        	
  	 	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 					    //새롭게 등록된 파일의 경우 이전 파일 폴더에서 삭제
  	 	 						(new File(savePath+"\\"+mrequest.getParameter("origin_post_data"+i))).delete();
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	 	        
  	 	 	        //게시물 키워드 소제목일 때
  	 	 	        }else if(post_keyword[i].equals("strapline")){	        	
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 텍스트일 때	
  	 	 	        }else if(post_keyword[i].equals("text")){	        	
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 사진일 때	
  	 	 	        }else if(post_keyword[i].equals("photo")){
  	 	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 						(new File(savePath+"\\"+mrequest.getParameter("origin_post_data"+i))).delete();
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	 	        //게시물 키워드 동영상일 때	
  	 	 	        }else if(post_keyword[i].equals("video")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 버튼일 때	
  	 	 	        }else if(post_keyword[i].equals("button")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	          //게시물 키워드 구분선일 때
  	 	 	        }else if(post_keyword[i].equals("divisionline")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));	        	
  	 	 	        }
  	 				 //게시물 수정   
  	 	 	        resultpost += interiorService.updatePost(post);
  	 			}
  	 			
  	 		    //삭제된 게시물 순번에 새롭게 게시물을 등록한 경우
  	 	    	if(hidden_post_keyword[i].equals("empty")&&!post_keyword[i].equals("empty")){

  	 	    	//게시물 키워드 set
  	 	    	post.setPost_keyword(post_keyword[i]);	    		    	 	    	 	    
  	 	      	//게시물 키워드 커버일 때
  	 	        if(post_keyword[i].equals("cover")) {	        	
  	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 				String originalFilename = mf.getOriginalFilename();
  	 				long fileSize = mf.getSize();
  	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 				try {
  	 					if (originalFilename != "" && fileSize != 0) {
  	 						mf.transferTo(new File(saveFile));
  	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 					}
  	 				} catch (IllegalStateException e) {
  	 					e.printStackTrace();
  	 				} catch (IOException e) {
  	 					e.printStackTrace();
  	 				}
  	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	        
  	 	        //게시물 키워드 소제목일 때
  	 	        }else if(post_keyword[i].equals("strapline")){	        	
  	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	        //게시물 키워드 텍스트일 때	
  	 	        }else if(post_keyword[i].equals("text")){	        	
  	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	        //게시물 키워드 사진일 때	
  	 	        }else if(post_keyword[i].equals("photo")){
  	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 				String originalFilename = mf.getOriginalFilename();
  	 				long fileSize = mf.getSize();
  	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 				try {
  	 					if (originalFilename != "" && fileSize != 0) {
  	 						mf.transferTo(new File(saveFile));
  	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 					}
  	 				} catch (IllegalStateException e) {
  	 					e.printStackTrace();
  	 				} catch (IOException e) {
  	 					e.printStackTrace();
  	 				}
  	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	        //게시물 키워드 동영상일 때	
  	 	        }else if(post_keyword[i].equals("video")){
  	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	        //게시물 키워드 버튼일 때	
  	 	        }else if(post_keyword[i].equals("button")){
  	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	          //게시물 키워드 구분선일 때
  	 	        }else if(post_keyword[i].equals("divisionline")){
  	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));	        	
  	 	        }
  	 	        //게시물 등록
  	 	        resultpost += interiorService.insertPost(post);
  	 	    	} 	 			 	 			
  	 		}
  	 		//기존의 게시물 외 추가 등록된 게시물이 있을 경우
  	 		if(post_keyword.length>post_no.length) {
  	 		    int index = post_keyword.length-(post_keyword.length-post_no.length);
  	 		    //추가 등록된 만큼 게시물 등록 for문
  	 			for(int i=index; i <post_keyword.length;i++) {
  	 			    if(!post_keyword[i].equals("empty")) {
  	 				//게시물 객체 생성 	 	
  	 	 			Post post = new Post();
  	 	 			//게시판번호 set
  	 	 	    	post.setBoard_no(board.getBoard_no());
  	 				//게시물 키워드 set
  	 	 	    	post.setPost_keyword(post_keyword[i]);	    		    
  	 	 	    	
  	 	 	 
  	 	 	     	//게시물 키워드 커버일 때
  	 	 	        if(post_keyword[i].equals("cover")) {	        	
  	 	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	 	        
  	 	 	        //게시물 키워드 소제목일 때
  	 	 	        }else if(post_keyword[i].equals("strapline")){	        	
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 텍스트일 때	
  	 	 	        }else if(post_keyword[i].equals("text")){	        	
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 사진일 때	
  	 	 	        }else if(post_keyword[i].equals("photo")){
  	 	 				MultipartFile mf = mrequest.getFile("post_data" + i);
  	 	 				String originalFilename = mf.getOriginalFilename();
  	 	 				long fileSize = mf.getSize();
  	 	 				String saveFile = savePath + "\\" + System.currentTimeMillis() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
  	 	 				try {
  	 	 					if (originalFilename != "" && fileSize != 0) {
  	 	 						mf.transferTo(new File(saveFile));
  	 	 						post.setPost_data(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
  	 	 					}
  	 	 				} catch (IllegalStateException e) {
  	 	 					e.printStackTrace();
  	 	 				} catch (IOException e) {
  	 	 					e.printStackTrace();
  	 	 				}
  	 	 				post.setPost_contents(mrequest.getParameter("post_contents" + i));
  	 	 	        //게시물 키워드 동영상일 때	
  	 	 	        }else if(post_keyword[i].equals("video")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	 	        //게시물 키워드 버튼일 때	
  	 	 	        }else if(post_keyword[i].equals("button")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));
  	 	 	        	post.setPost_contents(mrequest.getParameter("post_contents"+i));
  	 	          //게시물 키워드 구분선일 때
  	 	 	        }else if(post_keyword[i].equals("divisionline")){
  	 	 	        	post.setPost_data(mrequest.getParameter("post_data"+i));	        	
  	 	 	        }	 	 	       
  	 	 	        //게시물 등록
  	 	 	        resultpost += interiorService.insertPost(post);
  	 			    }
  	 			}
  	 			
  	     	}
  	 		//수정후 수정뷰페이지로 이동 (곧 수정후 게시판 디테일로 이동하게 만들 예정)
  	 		return "redirect:ibselect.do?board_no="+board.getBoard_no()+"&board_type="+board.getBoard_type();	
  		}
  	 	
  	 	 //게시물 삭제
  	 	@RequestMapping(value="ipdelete.do",method = RequestMethod.POST)
  	 	@ResponseBody
  	 	public int deletePost(Post post) {
  			int result = interiorService.deletePost(post.getPost_no());
  		return result;
  		}
  	 	
  	 	
  	 	
//-------------------------서은 PART------------------------------------------------	
  		
  		@RequestMapping("imyboard.do")
  		public String moveMyBoardPage() {
  			return "interior/interiorMyBoard";
  		}
  		
  		@RequestMapping("iwritepage.do")
  		public String moveWritePage() {
  			return "interior/interiorWritePage";
  		}

  		@RequestMapping("ibinsertview.do")
  		public String moveBoardInsertView(@RequestParam(name = "board_type") String board_type) {
  			if (board_type.equals("photograph")) {
  				return "interior/interiorPhotographInsert";
  			} else if (board_type.equals("housewarming")) {
  				return "interior/interiorHousewarmingInsert";
  			} else {
  				return "interior/interiorKnowhowInsert";
  			}
  		}

  		@RequestMapping("ibupdateview.do")
  		public ModelAndView selectBoardUpdateView(ModelAndView mv, BoardFull boardfull) {
  			  ArrayList<BoardFull> iblist = interiorService.selectBoardUpdateView(boardfull.getBoard_no());
  		      
  		      if(iblist.get(0).getBoard_type().equals("photograph")) {
  		          mv.addObject("iblist", iblist);
  		          mv.setViewName("interior/interiorPhotographUpdate");
  		          return mv;
  		         }else if(iblist.get(0).getBoard_type().equals("housewarming")) {
  		         mv.addObject("iblist", iblist);
  		         mv.setViewName("interior/interiorHousewarmingUpdate");
  		         return mv;
  		         }else {
  		          mv.addObject("iblist", iblist);
  		         mv.setViewName("interior/interiorKnowhowUpdate");
  		         return mv;
  		         }		
  		}

  		
  		// 게시판 전체 삭제
  		@RequestMapping("ibdelete.do")
  		public String deleteBoard(Board board) {
  			int result0 = interiorService.deleteAllLike(board.getBoard_no());
  			int result1 = interiorService.deleteAllPost(board.getBoard_no());
  			int result2 = interiorService.deleteBoard(board.getBoard_no());
  			return "redirect:iblistselect.do?board_type=" + board.getBoard_type();
  		}	

  		

  		// 게시판 (사진, 집들이 노하우)상세로 이동
  		@RequestMapping("ibselect.do")
  		public ModelAndView selectBoard(ModelAndView mv, @RequestParam(name = "board_no") int board_no,
  				@RequestParam(name = "board_type") String board_type) {

  			if (board_type.equals("photograph")) {
  				ArrayList<BoardFull> photoList = interiorService.selectPhotoList(board_no);
  				if (photoList != null) {
  					interiorService.updateBoardHits(board_no);
  					mv.addObject("photoList", photoList);
  					mv.setViewName("interior/interiorPhotographDetail");
  	                
  				} else {
  					mv.addObject("message", "인테리어 사진 정보 상세 조회에 실패하였습니다.");
  					mv.setViewName("common/error");
  				}
  				return mv;
  			} else if (board_type.equals("housewarming")) {
  				ArrayList<BoardFull> houseWList = interiorService.selectHouseWList(board_no);
  				if (houseWList != null) {
  					interiorService.updateBoardHits(board_no);
  					mv.addObject("houseWList", houseWList);
  					mv.setViewName("interior/interiorHousewarmingDetail");
  				} else {
  					mv.addObject("message", "인테리어 집들이 정보 상세 조회에 실패하였습니다.");
  					mv.setViewName("common/error");
  				}

  				return mv;
  			} else {
  				// 성현
  				ArrayList<BoardFull> knowHowPostList = interiorService.selectKnowHowPostList(board_no);
  				if (knowHowPostList != null) {
  					mv.addObject("knowHowPostList", knowHowPostList);
  					mv.setViewName("interior/interiorKnowhowDetail");
  				} else {
  					mv.addObject("message", "인테리어 노하우 정보 상세 조회에 실패하였습니다.");
  					mv.setViewName("common/error");
  				}
  				return mv;
  			}
  		}
  		
//-------------------------성현 PART------------------------------------------------		
	
	//좋아요 체크
 	@RequestMapping(value="ilcheck.do", method = RequestMethod.POST)
 	public void selectKnowhowLikeCheck(Like like,HttpServletResponse response) {
 		int result = interiorService.selectKnowhowLikeCheck(like);
 		String sresult = Integer.toString(result);
 		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
 	}
 	
    //팔로우 체크
    @RequestMapping(value="ifcheck.do", method = RequestMethod.POST)
    public void selectKnowhowfollowCheck(Follow follow, HttpServletResponse response) {    
       int result = interiorService.selectKnowhowfollowCheck(follow); 
		String sresult = Integer.toString(result);
 		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    //신고체크
	@RequestMapping(value="rkcheck.do", method=RequestMethod.POST)
	public void selectRealtyReportCheck(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int contents_no = ((Long)job.get("contents_no")).intValue();
		int user_no = ((Long)job.get("user_no")).intValue();
		
		Report report = new Report();
		report.setContents_no(contents_no);
		report.setUser_no(user_no);
		
		int reportCheck = interiorService.selectKnowhowReportCheck(report);
		String sreportCheck = Integer.toString(reportCheck);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sreportCheck);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}    
    
    //신고하기
	@RequestMapping(value="rkinsert.do", method=RequestMethod.POST)
	public void insertKnowhowReport(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		String category = (String)job.get("category");
		int contents_no = ((Long)job.get("contents_no")).intValue();
		String contents = (String)job.get("contents");
		int user_no = ((Long)job.get("user_no")).intValue();
		
		Report report = new Report();
		report.setCategory(category);
		report.setContents_no(contents_no);
		report.setContents(contents);
		report.setUser_no(user_no);
		
		int result = interiorService.insertKnowhowReport(report);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}    
}
