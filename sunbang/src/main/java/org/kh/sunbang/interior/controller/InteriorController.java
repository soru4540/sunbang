package org.kh.sunbang.interior.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.service.InteriorService;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
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
 		
 		return mv;
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
 					if (total_num >= 16)
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
 				if (total_num >= 12)
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
 				if (total_num >= 12)
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
 	
 	@RequestMapping("istory.do")
 	public ModelAndView moveStoryList(ModelAndView mv,Follow follow) {		
 		int result = interiorService.selectCheckFollow(follow);
 		mv.addObject("checkfollow", result);
 		mv.addObject("follower_no",follow.getFollower_no());
 		mv.setViewName("interior/interiorStoryList");
 		return mv;	
 	}
 	
 	@RequestMapping(value="islistselect.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 	@ResponseBody
 	public String selectStoryList(Ipaging ipaging, HttpServletResponse response) {		
            	JSONArray jarray = new JSONArray();
 			JSONArray jarray2 = new JSONArray();
 			JSONObject sendObj = new JSONObject();
 			ipaging.setKeyword1("empty");
 			ipaging.setKeyword2("empty");
 			ipaging.setKeyword3("empty");
 			ipaging.setKeyword4("empty");
 			ipaging.setKeyword5("empty");
 			try {
 				int total_num = interiorService.selectListCount(ipaging.getBoard_type()); // 데이터의 전체 갯수를 가져온다.
 				int page = ipaging.getPage();
 				if (page == 1) {
 					ipaging.setStart_num(1);
 					if (total_num >= 12)
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
 	/*
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
 			
 	    //게시판상세뷰 매핑으로
 		return "redirect:ibselect.do?board_no="+board_no;		
 	}	
 	*/
 	
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
 			jarray.add(jreplyfull);			
 		}
 		}catch (Exception e) {
 			e.printStackTrace();
 		}
 		sendObj.put("irlist", jarray);			
 		return sendObj.toJSONString();
 	}	
 	
 	
 	
//-------------------------서은 PART------------------------------------------------	
	
	
	@RequestMapping("iwritepage.do")
	public String moveWritePage() {
		
		return "interior/interiorWritePage";
	}
	
	@RequestMapping("ibinsertview.do")
	public String moveBoardInsertView(@RequestParam(name="board_type") String board_type){		
	
		if(board_type.equals("photograph")) {
			 return "interior/interiorPhotographInsert";			
			}else if(board_type.equals("housewarming")) {
				 return "interior/interiorHouseWarmingInsert";		
			}else {
				 return "interior/interiorKnowhowInsert";		
			}
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
	
	//게시판 (사진, 집들이 노하우)상세로 이동 
	@RequestMapping("ibselect.do")
	public ModelAndView selectBoard(ModelAndView mv, @RequestParam(name = "board_no") String board_no, @RequestParam(name = "board_type") String board_type) {

	      if (board_type.equals("photograph")) {
	         mv.setViewName("interior/interiorPhotograghDetail");
	         return mv;
	      } else if (board_type.equals("housewarming")) {
	         mv.setViewName("interior/interiorHousewarmingDetail");
	         return mv;
	      } else {
	    	 //성현
	    	 ArrayList<BoardFull> knowHowPostList = interiorService.selectKnowHowPostList(Integer.parseInt(board_no));
	         if(knowHowPostList != null) {
	 			mv.addObject("knowHowPostList", knowHowPostList);
	 			mv.setViewName("interior/interiorKnowhowDetail");
	         }else {
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
