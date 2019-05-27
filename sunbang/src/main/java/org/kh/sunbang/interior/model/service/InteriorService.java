package org.kh.sunbang.interior.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.FollowFull;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Marker;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.kh.sunbang.interior.model.vo.ReplyFull;
import org.kh.sunbang.user.model.vo.User;

public interface InteriorService {
	//추상메소드만 멤버로 가짐
	//[public abstract] 반환형 메소드명(자료형 매개변수);
	
	BoardFull selectHbTop1();
	ArrayList<BoardFull> selectKbTop4();
	ArrayList<BoardFull> selectHbTop3();
	ArrayList<BoardFull> selectPbTop8(); 
	int selectSearchListCount(String keyword);
	ArrayList<BoardFull> selectSearchList(Ipaging ipaging); 
	int insertBoard(Board board);
	int selectBoardNo(int user_no);
	int insertPost(Post post);
	int selectPostNo(int board_no);
	int insertMarker(Marker marker);
	ArrayList<BoardFull> selectBoardUpdateView(int board_no);
	int updateBoard(Board board);
	int updatePost(Post post);
	int updateMarker(Marker marker);
	int deleteBoard(int board_no);
	int deletePost(int post_no);
	int deleteMarker(int marker_no);
	int selectListCount(String board_type);
	ArrayList<BoardFull> selectBoardList(Ipaging ipaging);
	int selectList1Count(String board_type);
	ArrayList<Board> selectBoardFilter1List(ArrayList<String> keyword); 
	int selectList2Count(String board_type);
	ArrayList<Board> selectBoardFilter2List(ArrayList<String> keyword);
	int selectList3Count(String board_type);
	ArrayList<Board> selectBoardFilter3List(ArrayList<String> keyword); 
	ArrayList<Like> selectLikeCheck(int user_no); 
    Board selectBoard(int board_no);
	int insertLike(Like like);
	int deleteLike(Like like);
	int insertFollow(Follow follow);
	int deleteFollow(Follow follow);
	int selectList4Count(int user_no);
	int selectCheckFollow(Follow follow);
	ArrayList<Board> selectStoryList(int user_no); 
	FollowFull selectUserFollowFollowing(int user_no);
	ArrayList<FollowFull> selectFollowList(FollowFull followfull); 
	ArrayList<FollowFull> selectFollowingList(FollowFull followfull);
	ArrayList<Follow> selectFollowSearch(String keyword);
    ArrayList<Follow> selectFollowingSearch(String keyword); 
	int selectList5Count(int user_no);
	ArrayList<Board> selectNewsFeedList(int user_no); 
    int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReply(int reply_no);	
	ArrayList<ReplyFull> selectReplyList(int board_no);
	User selectMyProfile(int user_no);
	int insertBoardHits(int board_no);
	int insertReport(Report report);
	
	//--------------------성현씨------------------------------------------------//	
	ArrayList<BoardFull> selectKnowHowPostList(int board_no);
	int selectKnowhowLikeCheck(Like like);
	int selectKnowhowfollowCheck(Follow follow);
	int selectKnowhowReportCheck(Report report);
	int insertKnowhowReport(Report report);
	int updateBoardHits(int board_no);

	//----------------------서은------------------------//
		
		ArrayList<BoardFull> selectPhotoList(int board_no);	
		ArrayList<BoardFull> selectHouseWList(int board_no);
	
	
}
