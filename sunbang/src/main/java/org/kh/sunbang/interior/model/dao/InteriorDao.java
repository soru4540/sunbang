package org.kh.sunbang.interior.model.dao;

import org.springframework.stereotype.Repository;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.interior.model.vo.Post;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("interiorDao")
public class InteriorDao {
	
	
//-----------------------------------------JB---------------------------------------------------
		public BoardFull selectHbTop1(SqlSessionTemplate session) {	
			return session.selectOne("interiorMapper.selectHbTop1");
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
        
		
		
		
		
//-----------------------------------------SE---------------------------------------------------

		
}
