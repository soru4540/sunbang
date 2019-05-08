package org.kh.sunbang.realty.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.realty.model.vo.Realty;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("realtyDao")
public class RealtyDao {

//성현---------------------------------------------------------------------------------------------------------------------		
	
	public Realty selectRealtyDetailView(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyDetailView", realty_no);
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
	
//형진---------------------------------------------------------------------------------------------------------------	
	
	public ArrayList<Realty> selectMarkerList(SqlSessionTemplate mybatisSession) {
		List<Realty> list =  mybatisSession.selectList("realtyMapper.selectMarkerList");
		return (ArrayList<Realty>)list;
	}







}
