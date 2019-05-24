package org.kh.sunbang.realty.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("realtyDao")
public class RealtyDao {

	//성현---------------------------------------------------------------------------------------------------------------------		
	
	public Realty selectRealtyDetailView(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyDetailView", realty_no);
	}
	
	public User selectUserInfo(SqlSessionTemplate mybatisSession, int user_no) {
		return mybatisSession.selectOne("realtyMapper.selectUserInfo", user_no);
	}
	
	public ArrayList<BoardFull> selectRecommendInteriorTop5(SqlSessionTemplate mybatisSession, Realty realty) {
		List<BoardFull> recommenditop5 = mybatisSession.selectList("realtyMapper.selectRecommendInteriorTop5", realty);
		return (ArrayList<BoardFull>)recommenditop5;
	}
	
	public ArrayList<BoardFull> selectRecommendInterior(SqlSessionTemplate mybatisSession) {
		List<BoardFull> recommenditop5 = mybatisSession.selectList("realtyMapper.selectRecommendInterior");
		return (ArrayList<BoardFull>)recommenditop5;
	}
	
	public int selectRealtyNo(SqlSessionTemplate mybatisSession, int user_no) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyNo", user_no);
	}
	
	public int selectDibsCount(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.selectOne("realtyMapper.selectDibsCount", realty_no);
	}	
	
	public int selectDibsCheck(SqlSessionTemplate mybatisSession, Dibs dibs) {
		return mybatisSession.selectOne("realtyMapper.selectDibsCheck", dibs);
	}
	
	public int insertDibs(SqlSessionTemplate mybatisSession, Dibs dibs) {
		return mybatisSession.insert("realtyMapper.insertDibs", dibs);
	}
	
	public int deleteDibs(SqlSessionTemplate mybatisSession, Dibs dibs) {
		return mybatisSession.delete("realtyMapper.deleteDibs", dibs);
	}
	
	public int selectRealtyReportCheck(SqlSessionTemplate mybatisSession, Report report) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyReportCheck", report);
	}
	
	public int insertRealtyReport(SqlSessionTemplate mybatisSession, Report report) {
		return mybatisSession.insert("realtyMapper.insertRealtyReport", report);
	}
	
	public int updateRealtyHits(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.update("realtyMapper.updateRealtyHits", realty_no);
	}
	
	public int insertRealty(SqlSessionTemplate mybatisSession, Realty realty) {
		return mybatisSession.insert("realtyMapper.insertRealty", realty);
	}
	
	public int selectRealtyCount(SqlSessionTemplate mybatisSession, int user_no) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyCount", user_no);
	}
	
	public ArrayList<Realty> selectRealtyMyListView(SqlSessionTemplate mybatisSession, int user_no) {
		List<Realty> realtylist = mybatisSession.selectList("realtyMapper.selectRealtyMyListView", user_no);
		return (ArrayList<Realty>)realtylist;
	}
	
	public int updateRealtyMyListDelete(SqlSessionTemplate mybatisSession, Realty realty) {
		return mybatisSession.update("realtyMapper.updateRealtyMyListDelete", realty);
	}
	
	public int updateRealtyStatus(SqlSessionTemplate mybatisSession, Realty realty) {
		return mybatisSession.update("realtyMapper.updateRealtyStatus", realty);
	}
	
	public int updateRealty(SqlSessionTemplate mybatisSession, Realty realty) {
		return mybatisSession.update("realtyMapper.updateRealty", realty);
	}

	//형진---------------------------------------------------------------------------------------------------------------	

	public ArrayList<Realty> selectMarkerList(SqlSessionTemplate mybatisSession) {
		List<Realty> list = mybatisSession.selectList("realtyMapper.selectMarkerList");
		return (ArrayList<Realty>) list;
	}

	public ArrayList<Realty> selectRealtyList(SqlSessionTemplate mybatisSession, ArrayList<Integer> realtyno) {
		ArrayList<Realty> realtyList = new ArrayList<Realty>();
		for (int i = 0; i < realtyno.size(); i++) {
			Realty realty = mybatisSession.selectOne("realtyMapper.selectRealtyList", realtyno.get(i));
			realtyList.add(realty);
		}
		return realtyList;
	}

	// 진솔-------------------------------------------------------------------------------------------------------------
	
	public ArrayList<Realty> selectRealtyTop5(SqlSessionTemplate mybatisSession) {
		List<Realty> list = mybatisSession.selectList("realtyMapper.selectTop5");
		return (ArrayList<Realty>) list;
	}

}
