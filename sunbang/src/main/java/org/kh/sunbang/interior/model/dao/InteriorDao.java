package org.kh.sunbang.interior.model.dao;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Ipaging;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.interior.model.vo.Post;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("interiorDao")
public class InteriorDao {
	
	
//-----------------------------------------JB---------------------------------------------------
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

    public int selectListCount(SqlSessionTemplate session, String board_type) {			
		return session.selectOne("interiorMapper.selectListCount",board_type);
	}
	
	//게시판 리스트 출력 (사진, 집들이, 노하우)
	public ArrayList<BoardFull> selectBoardList(SqlSessionTemplate session, Ipaging ipaging) {
		List<BoardFull> iblist =session.selectList("interiorMapper.selectBoardList",ipaging);
		return (ArrayList<BoardFull>)iblist;
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
//-----------------------------------------SE---------------------------------------------------

		
}
