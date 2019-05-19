package org.kh.sunbang.realty.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.kh.sunbang.realty.model.dao.RealtyDao;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.User;
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
	
	//성현---------------------------------------------------------------------------------------------------------------------	
	
	@Override
	public Realty selectRealtyDetailView(int realty_no) { //매물상세페이지
		return realtyDao.selectRealtyDetailView(mybatisSession, realty_no);
	}
	
	@Override
	public User selectUserInfo(int user_no) { //매물상세페이지 :등록자 정보
		return realtyDao.selectUserInfo(mybatisSession, user_no);
	}
	
	@Override
	public ArrayList<BoardFull> selectRecommendInteriorTop5(Realty realty) { //인테리어 추천 top5
		return realtyDao.selectRecommendInteriorTop5(mybatisSession, realty);
	}
	
	@Override
	public int selectRealtyNo(int user_no) { //등록한 매물번호 가져오기
		return realtyDao.selectRealtyNo(mybatisSession, user_no);
	}
	
	@Override
	public int selectDibsCount(int realty_no) { //매물상세페이지 : 찜 count
		return realtyDao.selectDibsCount(mybatisSession, realty_no);
	}
	
	@Override
	public int selectDibsCheck(Dibs dibs) { //매물상세페이지 : 찜 check
		return realtyDao.selectDibsCheck(mybatisSession, dibs);
	}
	
	@Override
	public int insertDibs(Dibs dibs) { //매물상세페이지 : 찜 insert
		return realtyDao.insertDibs(mybatisSession, dibs);
	}

	@Override
	public int deleteDibs(Dibs dibs) { //매물상세페이지 : 찜 delete
		return realtyDao.deleteDibs(mybatisSession, dibs);
	}
	
	@Override
	public int selectRealtyReportCheck(Report report) { //매물상세페이지 : 신고 check
		return realtyDao.selectRealtyReportCheck(mybatisSession, report);
	}
	
	@Override
	public int insertRealtyReport(Report report) { //매물상세페이지 : 신고 insert
		return realtyDao.insertRealtyReport(mybatisSession, report);
	}
	
	@Override
	public void updateRealtyHits(int realty_no) { //매물조회수
		realtyDao.updateRealtyHits(mybatisSession, realty_no);
	}
	
	@Override
	public int insertRealty(Realty realty) { //매물등록
		return realtyDao.insertRealty(mybatisSession, realty);
	}

	@Override
	public int selectRealtyCount(int user_no) { //User가 등록한 매물 갯수 count
		return realtyDao.selectRealtyCount(mybatisSession, user_no);
	}

	@Override
	public ArrayList<Realty> selectRealtyMyListView(int user_no) { //내 방 리스트
		return realtyDao.selectRealtyMyListView(mybatisSession, user_no);
	}
	
	@Override
	public int updateRealtyMyListDelete(Realty realty) { //내 방 리스트 삭제 
		return realtyDao.updateRealtyMyListDelete(mybatisSession, realty);
	}
	
	@Override
	public int updateRealtyStatus(Realty realty) { //매물 상태 수정
		return realtyDao.updateRealtyStatus(mybatisSession, realty);
	}
	
	@Override
	public int updateRealty(Realty realty) { //매물 수정
		return realtyDao.updateRealty(mybatisSession, realty);
	}
	
	
	//형진---------------------------------------------------------------------------------------------------------------
	
	@Override
	public ArrayList<Realty> selectMarkerList() {
		return realtyDao.selectMarkerList(mybatisSession);
	}

	@Override
	public ArrayList<Realty> selectRealtyList(ArrayList<Integer> realtyno) {
		return realtyDao.selectRealtyList(mybatisSession, realtyno);
	}

	// 진솔 --------------------------------------------------------------------------------------------------------------
	
	@Override
	public ArrayList<Realty> selectRealtyTop5() {
		return realtyDao.selectRealtyTop5(mybatisSession);
	}

}
