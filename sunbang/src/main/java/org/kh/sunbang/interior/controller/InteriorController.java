package org.kh.sunbang.interior.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.kh.sunbang.interior.model.service.InteriorService;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	//인테리어 사진 게시판 필터
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
	
	//인테리어 집들이 게시판 필터
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
	
	//인테리어 노하우 게시판 필터
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
	
	
	@RequestMapping(value = "ipaging.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectBoardListPaging(Ipaging ipaging, HttpServletResponse response) {

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
				ipaging.setStart_num(page + ((7 * page) + 1)); // 17 25 33 2+14+1 3+ 21 +1
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
	
//-------------------------SE PART------------------------------------------------	
	
	
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
