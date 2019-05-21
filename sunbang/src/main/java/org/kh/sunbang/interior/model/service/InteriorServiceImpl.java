package org.kh.sunbang.interior.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.dao.InteriorDao;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Marker;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.kh.sunbang.interior.model.vo.ReplyFull;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("interiorService")
public class InteriorServiceImpl implements InteriorService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private InteriorDao interiorDao;

	
//--------------------진보------------------------------------------------//	
	
@Override
public BoardFull selectHbTop1() {		
	return interiorDao.selectHbTop1(session);
}

@Override
public ArrayList<BoardFull> selectKbTop4() {
	return interiorDao.selectKbTop4(session);
}

@Override
public ArrayList<BoardFull> selectHbTop3() {
	return interiorDao.selectHbTop3(session);	
}

@Override
public ArrayList<BoardFull> selectPbTop8() {
	return interiorDao.selectPbTop8(session);	
}

@Override
public int selectSearchListCount(String keyword) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public ArrayList<Board> selectSearchList(String keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int selectListCount(String board_type) {
     return interiorDao.selectListCount(session, board_type);
}

@Override
public ArrayList<BoardFull> selectBoardList(Ipaging ipaging) {		
	return interiorDao.selectBoardList(session, ipaging);
}

@Override
public int selectList1Count(String board_type) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public ArrayList<Board> selectBoardFilter1List(ArrayList<String> keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int selectList2Count(String board_type) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public ArrayList<Board> selectBoardFilter2List(ArrayList<String> keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int selectList3Count(String board_type) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public ArrayList<Board> selectBoardFilter3List(ArrayList<String> keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public ArrayList<Like> selectLikeCheck(int user_no) {
	return interiorDao.selectLikeCheck(session, user_no);
}

@Override
public int insertLike(Like like) {		
	return interiorDao.insertLike(session, like);
}

@Override
public int deleteLike(Like like) {		
	return interiorDao.deleteLike(session, like);
}

@Override
public int insertFollow(Follow follow) {   
   return interiorDao.insertFollow(session, follow);
}

@Override
public int deleteFollow(Follow follow) {
   return interiorDao.deleteFollow(session, follow);
}

@Override
public int selectList4Count(int user_no) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int selectCheckFollow(Follow follow) {	
	return interiorDao.selectCheckFollow(session, follow);
}

@Override
public ArrayList<Board> selectStoryList(int user_no) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public ArrayList<Follow> selectFollowList(int user_no) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public ArrayList<Follow> selectFollowSearch(String keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public ArrayList<Follow> selectFollowingSearch(String keyword) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int selectList5Count(int user_no) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public ArrayList<Board> selectNewsFeedList(int user_no) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public User selectMyProfile(int user_no) {
	// TODO Auto-generated method stub
	return null;
}
/*
//게시판등록
@Override
public int insertBoard(Board board) {		
return  interiorDao.insertBoard(session, board);
}
//게시판번호 불러오기	
@Override
public int selectBoardNo(int user_no) {		
	return interiorDao.selectBoardNo(session, user_no);
}
//게시물등록
@Override
public int insertPost(Post post) {	
	return interiorDao.insertPost(session, post);
}
*/

//댓글 등록
@Override
public int insertReply(Reply reply) {		
 	return interiorDao.insertReply(session, reply);
}

//댓글 수정
@Override
public int updateReply(Reply reply) {		
	return interiorDao.updateReply(session, reply);
}

//댓글 삭제
@Override
public int deleteReply(int reply_no) {	
	return interiorDao.deleteReply(session, reply_no);
}

//댓글 리스트 출력
@Override
public ArrayList<ReplyFull> selectReplyList(int board_no) {	
	return interiorDao.selectReplyList(session, board_no);
}
	



//--------------------서은------------------------------------------------//
	
	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBoardNo(int user_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectPostNo(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMarker(Marker marker) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectBoardUpdateView(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMarker(Marker marker) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePost(int post_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMarker(int marker_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectBoard(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertBoardHits(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
//--------------------성현------------------------------------------------//
	@Override
	public ArrayList<BoardFull> selectKnowHowPostList(int board_no) {
		return interiorDao.selectKnowHowPostList(session, board_no);
	}

	@Override
	public int selectKnowhowLikeCheck(Like like) {
		return interiorDao.selectKnowhowLikeCheck(session, like);
	}

	@Override
	public int selectKnowhowfollowCheck(Follow follow) {
		return interiorDao.selectKnowhowfollowCheck(session, follow);
	}

	@Override
	public int selectKnowhowReportCheck(Report report) {
		return interiorDao.selectKnowhowReportCheck(session, report);
	}	
	
	@Override
	public int insertKnowhowReport(Report report) {
		return interiorDao.insertKnowhowReport(session, report);
	}

	
}
