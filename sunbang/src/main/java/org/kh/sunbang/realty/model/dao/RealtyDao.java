package org.kh.sunbang.realty.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.realty.model.vo.Realty;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("realtyDao")
public class RealtyDao {

	public Realty selectRealtyDetailView(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.selectOne("realtyMapper.selectRealtyDetailView", realty_no);
	}

	public int updateRealtyHits(SqlSessionTemplate mybatisSession, int realty_no) {
		return mybatisSession.update("realtyMapper.updateRealtyHits", realty_no);
	}
	
	public ArrayList<Realty> selectMarkerList(SqlSessionTemplate mybatisSession) {
		List<Realty> list =  mybatisSession.selectList("realtyMapper.selectMarkerList");
		return (ArrayList<Realty>)list;
	}

}
