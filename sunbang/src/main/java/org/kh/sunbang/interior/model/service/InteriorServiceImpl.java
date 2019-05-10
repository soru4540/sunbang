package org.kh.sunbang.interior.model.service;

import java.util.ArrayList;

import org.kh.sunbang.interior.model.dao.InteriorDao;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Marker;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
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

	
//--------------------jb------------------------------------------------//	
	
	@Override
	public BoardFull selectHbTop1() {		
		return interiorDao.selectHbTop1(session);
	}

	@Override
	public ArrayList<Board> selectKbTop4() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectHbTop3() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectPbTop8() {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Board> selectBoardList(String board_type) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFollow(Follow follow) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFollow(Follow follow) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectList4Count(int user_no) {
		// TODO Auto-generated method stub
		return 0;
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
	//--------------------se------------------------------------------------//
	
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
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(ArrayList<Integer> board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoardHits(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	
}
