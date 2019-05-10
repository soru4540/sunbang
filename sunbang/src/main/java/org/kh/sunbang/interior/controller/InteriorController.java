package org.kh.sunbang.interior.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.kh.sunbang.interior.model.service.InteriorService;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InteriorController {
	
   @Autowired
   private InteriorService interiorService;
	
//-------------------------JB PART------------------------------------------------
	
	@RequestMapping("interiormain.do")
	public ModelAndView selectInteriorMain(ModelAndView mv, HttpServletRequest request) {
		
		mv.setViewName("interior/interiorMain");
		return mv;
	}
	
	@RequestMapping("ihtop1select.do")
	public void selectHbTop1(BoardFull boardfull, HttpServletResponse response) {				
		boardfull = interiorService.selectHbTop1();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
			 out = response.getWriter();
			 JSONObject job = new JSONObject();
			 job.put("board_no", boardfull.getBoard_no());
			 job.put("post_no", boardfull.getPost_no());
			 job.put("board_hits", boardfull.getPost_keyword());
			 job.put("post_data", boardfull.getPost_data());
			 job.put("user_no", boardfull.getUser_no());
			 out.write(job.toJSONString());		
		
		} catch (IOException e) {			
			e.printStackTrace();
		}finally {
			 out.flush();
			 out.close();
		}				 
	}
	
	@RequestMapping("iktop4select.do")
	public void selectKbTop4(BoardFull boardfull, HttpServletResponse response) {		
		
	}
	
	@RequestMapping("ihtop3select.do")
	public void selectHbTop3(BoardFull boardfull, HttpServletResponse response) {		
		
	}
	
	@RequestMapping("iptop8select.do")
	public void selectPbTop8(BoardFull boardfull, HttpServletResponse response) {		
		
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
