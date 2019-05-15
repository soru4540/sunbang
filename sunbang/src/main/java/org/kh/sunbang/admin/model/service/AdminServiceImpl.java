package org.kh.sunbang.admin.model.service;

import java.util.ArrayList;
import org.kh.sunbang.admin.model.dao.AdminDao;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate mybatisSession;

	@Autowired
	private AdminDao adminDao;

	@Override
	public ArrayList<Report> selectUnHandledList() {
		return adminDao.selectUnHandledList(mybatisSession);
	}
	
	@Override
	public ArrayList<Guide> selectGuideAllList(String guide_system){
		return adminDao.selectGuideAllList(mybatisSession, guide_system);
	}

	@Override
	public int guideInsert(Guide guide) {
		return adminDao.guideInsert(mybatisSession, guide);
	}

	@Override
	public ArrayList<Guide> selectGuideList(String category) {
		return adminDao.selectGuideList(mybatisSession, category);
	}

	@Override
	public Guide selectGuideDetail(int guide_no) {
		return adminDao.selectGuideDetail(mybatisSession, guide_no);
	}

	@Override
	public int deleteGuide(int guide_no) {
		return adminDao.deleteGuide(mybatisSession, guide_no);
	}
	
	@Override
	public ArrayList<PremiumFull> selectPremiumList(int currentPage, int limit) {
		return adminDao.selectPremiumList(mybatisSession, currentPage, limit);
	}

	@Override
	public int selectListCount() {
		return adminDao.selectListCount(mybatisSession);
	}

	@Override
	public PremiumFull selectBusinessDetail(int business_user_no) {
		return adminDao.selectBusinessDetail(mybatisSession, business_user_no);
	}
}
