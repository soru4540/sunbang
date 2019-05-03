package org.kh.sunbang.interior.model.service;

import java.util.ArrayList;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Marker;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.kh.sunbang.user.model.vo.User;

public interface InteriorService {
	//추상메소드만 멤버로 가짐
	//[public abstract] 반환형 메소드명(자료형 매개변수);
	
//--------------------jb------------------------------------------------//
	
	Board selectHbTop1();
	ArrayList<Board> selectKbTop4();
	ArrayList<Board> selectHbTop3();
	ArrayList<Board> selectPbTop8(); 
	int selectSearchListCount(String keyword);
	ArrayList<Board> selectSearchList(String keyword); 
/*	int insertBoard(Board board);
	int selectBoardNo(int user_no);
	int insertPost(Post post);
	int selectPostNo(int board_no);
	int insertMarker(Marker marker);
	Board selectBoardUpdateView(int board_no);
	int updateBoard(Board board);
	int updatePost(Post post);
	int updateMarker(Marker marker);
	int deleteBoard(int board_no);
	int deletePost(int post_no);
	int deleteMarker(int marker_no);*/
	int selectListCount(String board_type);
	ArrayList<Board> selectBoardList(String board_type);
	int selectList1Count(String board_type);
	ArrayList<Board> selectBoardFilter1List(ArrayList<String> keyword); 
	int selectList2Count(String board_type);
	ArrayList<Board> selectBoardFilter2List(ArrayList<String> keyword);
	int selectList3Count(String board_type);
	ArrayList<Board> selectBoardFilter3List(ArrayList<String> keyword); 
	ArrayList<Like> selectLikeCheck(int user_no); 
	/*Board selectBoard(int board_no);*/
	int insertLike(Like like);
	int deleteLike(Like like);
	int insertFollow(Follow follow);
	int deleteFollow(Follow follow);
	int selectList4Count(int user_no);
	ArrayList<Board> selectStoryList(int user_no); 
	ArrayList<Follow> selectFollowList(int user_no); 
	ArrayList<Follow> selectFollowSearch(String keyword);
    ArrayList<Follow> selectFollowingSearch(String keyword); 
	int selectList5Count(int user_no);
	ArrayList<Board> selectNewsFeedList(int user_no); 
  /*  int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReply(Reply reply);
	ArrayList<Reply> selectReplyList(ArrayList<Integer> board_no); */
	User selectMyProfile(int user_no);
	/*int insertBoardHits(int board_no);*/
	
	
//--------------------se------------------------------------------------//
	
	/*Board selectHbTop1();
	ArrayList<Board> selectKbTop4();
	ArrayList<Board> selectHbTop3();
	ArrayList<Board> selectPbTop8(); 
	int selectSearchListCount(String keyword);
	ArrayList<Board> selectSearchList(String keyword); */
	int insertBoard(Board board);
	int selectBoardNo(int user_no);
	int insertPost(Post post);
	int selectPostNo(int board_no);
	int insertMarker(Marker marker);
	Board selectBoardUpdateView(int board_no);
	int updateBoard(Board board);
	int updatePost(Post post);
	int updateMarker(Marker marker);
	int deleteBoard(int board_no);
	int deletePost(int post_no);
	int deleteMarker(int marker_no);
	/*int selectListCount(String board_type);
	ArrayList<Board> selectBoardList(String board_type);
	int selectList1Count(String board_type);
	ArrayList<Board> selectBoardFilter1List(ArrayList<String> keyword); 
	int selectList2Count(String board_type);
	ArrayList<Board> selectBoardFilter2List(ArrayList<String> keyword);
	int selectList3Count(String board_type);
	ArrayList<Board> selectBoardFilter3List(ArrayList<String> keyword); 
	ArrayList<Like> selectLikeCheck(int user_no); */
	Board selectBoard(int board_no);
/*	int insertLike(Like like);
	int deleteLike(Like like);
	int insertFollow(Follow follow);
	int deleteFollow(Follow follow);
	int selectList4Count(int user_no);
	ArrayList<Board> selectStoryList(int user_no); 
	ArrayList<Follow> selectFollowList(int user_no); 
	ArrayList<Follow> selectFollowSearch(String keyword);
    ArrayList<Follow> selectFollowingSearch(String keyword); 
	int selectList5Count(int user_no);
	ArrayList<Board> selectNewsFeedList(int user_no); */
    int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReply(Reply reply);
	ArrayList<Reply> selectReplyList(ArrayList<Integer> board_no); 
/*	User selectMyProfile(int user_no);*/
	int insertBoardHits(int board_no);
	
}
