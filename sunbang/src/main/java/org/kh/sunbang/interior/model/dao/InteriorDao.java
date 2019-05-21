package org.kh.sunbang.interior.model.dao;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Follow;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Post;
import org.kh.sunbang.interior.model.vo.Reply;
import org.kh.sunbang.interior.model.vo.ReplyFull;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("interiorDao")
public class InteriorDao {
	
	
//-----------------------------------------진보---------------------------------------------------
	//집들이 TOP1 불러오기
    public BoardFull selectHbTop1(SqlSessionTemplate session) {	
		return session.selectOne("interiorMapper.selectHbTop1");
	}

    //노하우 TOP4 불러오기
	public ArrayList<BoardFull> selectKbTop4(SqlSessionTemplate session) {
		List<BoardFull> list =session.selectList("interiorMapper.selectKbTop4");
		return (ArrayList<BoardFull>)list;
	}

	 //집들이 TOP3 불러오기
	public ArrayList<BoardFull> selectHbTop3(SqlSessionTemplate session) {
		List<BoardFull> list = session.selectList("interiorMapper.selectHbTop3");
		return (ArrayList<BoardFull>)list;
	}

	 //사진 TOP8 불러오기
	public ArrayList<BoardFull> selectPbTop8(SqlSessionTemplate session) {
		List<BoardFull> list =session.selectList("interiorMapper.selectPbTop8");
		return (ArrayList<BoardFull>)list;
	}
	
	
	//게시판 등록
	public int insertBoard(SqlSessionTemplate session, Board board) {	
		return session.insert("interiorMapper.insertBoard",board);		
	}
    //게시판 번호 불러오기
	public int selectBoardNo(SqlSessionTemplate session, int user_no) {	
		return session.selectOne("interiorMapper.selectBoardNo",user_no);
	}
    //게시물 등록
	public int insertPost(SqlSessionTemplate session, Post post) {		
		return session.insert("interiorMapper.insertPost",post);
	}
    //게시판 리스트 카운트(사진, 집들이, 노하우)
    public int selectListCount(SqlSessionTemplate session, String board_type) {			
		return session.selectOne("interiorMapper.selectListCount",board_type);
	}
	
	//게시판 리스트 출력 (사진, 집들이, 노하우)
	public ArrayList<BoardFull> selectBoardList(SqlSessionTemplate session, Ipaging ipaging) {		
		if(ipaging.getBoard_type().equals("photograph")) {
		List<BoardFull> iblist =session.selectList("interiorMapper.selectPhotographList",ipaging);
		return (ArrayList<BoardFull>)iblist;
		}else if(ipaging.getBoard_type().equals("housewarming")) {
		List<BoardFull> iblist =session.selectList("interiorMapper.selectHousewarmingList",ipaging);
		return (ArrayList<BoardFull>)iblist;
		}else {
		List<BoardFull> iblist =session.selectList("interiorMapper.selectKnowhowList",ipaging);
		return (ArrayList<BoardFull>)iblist;	
		}
		
	}

	//좋아요 체크 리스트 출력
	public ArrayList<Like> selectLikeCheck(SqlSessionTemplate session, int user_no) {		
		List<Like> illist =session.selectList("interiorMapper.selectLikeCheck",user_no);
		return (ArrayList<Like>)illist;
	}

	//좋아요 등록
	public int insertLike(SqlSessionTemplate session, Like like) {			
		return session.insert("interiorMapper.insertLike",like);
	}

	//좋아요 삭제
	public int deleteLike(SqlSessionTemplate session, Like like) {		
		return session.delete("interiorMapper.deleteLike",like);
	}
	
	//팔로우 추가
	public int insertFollow(SqlSessionTemplate session, Follow follow) {   
		return session.insert("interiorMapper.insertFollow",follow);
	}
	//팔로우 삭제
	public int deleteFollow(SqlSessionTemplate session, Follow follow) {
		return session.delete("interiorMapper.deleteFollow",follow);
	}
	
	//댓글 리스트 출력
	public ArrayList<ReplyFull> selectReplyList(SqlSessionTemplate session, int board_no) {		
		List<ReplyFull> irlist = session.selectList("interiorMapper.selectReplyList",board_no);
		return (ArrayList<ReplyFull>)irlist;			
	}
	//댓글 등록
	public int insertReply(SqlSessionTemplate session, Reply reply) {	
		return session.insert("interiorMapper.insertReply",reply);
	}
    //댓글 삭제
	public int deleteReply(SqlSessionTemplate session, int reply_no) {		
		return session.delete("interiorMapper.deleteReply", reply_no);
	}
    //댓글 수정
	public int updateReply(SqlSessionTemplate session, Reply reply) {		
		return session.update("interiorMapper.updateReply",reply);
	}
    //유저 팔로우 체크
	public int selectCheckFollow(SqlSessionTemplate session, Follow follow) {	
		return session.selectOne("interiorMapper.selectCheckFollow",follow);
	}
//-----------------------------------------서은---------------------------------------------------


	

//-----------------------------------------성현---------------------------------------------------
	public ArrayList<BoardFull> selectKnowHowPostList(SqlSessionTemplate session, int board_no) {
		List<BoardFull> list = session.selectList("interiorMapper.selectKnowHowPostList", board_no);
		return (ArrayList<BoardFull>)list;
	}

	public int selectKnowhowLikeCheck(SqlSessionTemplate session, Like like) {
		return session.selectOne("interiorMapper.selectKnowhowLikeCheck", like);
	}

	public int selectKnowhowfollowCheck(SqlSessionTemplate session, Follow follow) {
		return session.selectOne("interiorMapper.selectKnowhowfollowCheck", follow);
	}

	public int insertKnowhowReport(SqlSessionTemplate session, Report report) {
		return session.insert("interiorMapper.insertKnowhowReport", report);
	}

	public int selectKnowhowReportCheck(SqlSessionTemplate session, Report report) {
		return session.selectOne("interiorMapper.selectKnowhowReportCheck", report);
	}
	
	
		
}
