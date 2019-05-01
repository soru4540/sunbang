package org.kh.sunbang.realty.model.service;

import org.kh.sunbang.realty.model.dao.RealtyDao;
import org.kh.sunbang.realty.model.vo.Realty;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("realtyService")
public class RealtyServiceImpl implements RealtyService {
	//마이바티스 연동 객체 선언 - 자동 의존성 주입
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private RealtyDao realtyDao;
	
	@Override
	public Realty selectRealtyDetailView(int realty_no) { //매물상세페이지
		return realtyDao.selectRealtyDetailView(mybatisSession, realty_no);
	}

	@Override
	public void updateRealtyHits(int realty_no) { //매물조회수
		realtyDao.updateRealtyHits(mybatisSession, realty_no);
	}
}
