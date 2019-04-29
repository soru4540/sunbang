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
	public Realty selectRealtyDetail(int realty_no) {
		return realtyDao.selectRealtyDetail(mybatisSession, realty_no);
	}
}
