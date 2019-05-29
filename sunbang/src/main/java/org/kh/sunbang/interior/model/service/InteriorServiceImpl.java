package org.kh.sunbang.interior.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.dao.InteriorDao;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.FollowFull;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
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
	public ArrayList<BoardFull> selectInteriorTop5() {
		return interiorDao.selectInteriorTop5(session);
	}

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
		return interiorDao.selectSearchListCount(session, keyword);
	}

	@Override
	public ArrayList<BoardFull> selectSearchList(String keyword) {
		return interiorDao.selectSearchList(session, keyword);
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
	public int selectCheckFollow(Follow follow) {
		return interiorDao.selectCheckFollow(session, follow);
	}

	@Override
	public int selectStoryListCount(Ipaging ipaging) {
		return interiorDao.selectStoryListCount(session, ipaging);
	}

	@Override
	public ArrayList<BoardFull> selectStoryList(Ipaging ipaging) {
		return interiorDao.selectStoryList(session, ipaging);
	}

	@Override
	public int selectNewsFeedListCount(Ipaging ipaging) {
		return interiorDao.selectNewsFeedListCount(session, ipaging);
	}

	@Override
	public ArrayList<BoardFull> selectNewsFeedList(Ipaging ipaging) {
		return interiorDao.selectNewsFeedList(session, ipaging);
	}

//게시판등록
	@Override
	public int insertBoard(Board board) {
		return interiorDao.insertBoard(session, board);
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

//인테리어 유저 신고 등록	
	@Override
	public int insertReport(Report report) {
		return interiorDao.insertReport(session, report);
	}

//게시판 수정페이지 출력
	@Override
	public ArrayList<BoardFull> selectBoardUpdateView(int board_no) {
		return interiorDao.selectBoardUpdateView(session, board_no);
	}

//게시판 수정 (노하우)
	@Override
	public int updateBoard(Board board) {
		return interiorDao.updateBoard(session, board);
	}

//게시물 수정 (노하우)
	@Override
	public int updatePost(Post post) {
		return interiorDao.updatePost(session, post);
	}

	@Override
	public int deletePost(int post_no) {
		return interiorDao.deletePost(session, post_no);
	}

//유저의 팔로우수 팔로잉수 출력
	@Override
	public FollowFull selectUserFollowFollowing(int user_no) {
		return interiorDao.selectUserFollowFollowing(session, user_no);
	}

//유저의 팔로워들 출력
	@Override
	public ArrayList<FollowFull> selectFollowList(FollowFull followfull) {
		return interiorDao.selectFollowList(session, followfull);
	}

//유저의 팔로잉들 출력
	@Override
	public ArrayList<FollowFull> selectFollowingList(FollowFull followfull) {
		return interiorDao.selectFollowingList(session, followfull);
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

	@Override
	public int updateBoardHits(int board_no) {
		return interiorDao.updateBoardHits(session, board_no);
	}
	

	// --------------------서은------------------------------------------------//

	
	// 사진상세
	@Override
	public ArrayList<BoardFull> selectPhotoList(int board_no) {
		return interiorDao.selectPhotoList(session, board_no);
	}

	// 집들이상세
	@Override
	public ArrayList<BoardFull> selectHouseWList(int board_no) {
		return interiorDao.selectHouseWList(session, board_no);
	}

	// 전체삭제 - 좋아요
	@Override
	public int deleteAllLike(int board_no) {
		return interiorDao.deleteAllLike(session, board_no);
	}

	// 전체삭제 - 게시물
	@Override
	public int deleteAllPost(int board_no) {
		return interiorDao.deleteAllPost(session, board_no);
	}

	// 전체삭제 - 게시판
	@Override
	public int deleteBoard(int board_no) {
		return interiorDao.deleteBoard(session, board_no);
	}



}
