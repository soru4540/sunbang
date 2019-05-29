package org.kh.sunbang.admin.model.service;

import java.sql.Date;
import java.util.ArrayList;
import org.kh.sunbang.admin.model.dao.AdminDao;
import org.kh.sunbang.admin.model.vo.Apaging;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.user.model.vo.User;
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
	public int selectListCount() {
		return adminDao.selectListCount(mybatisSession);
	}

	@Override
	public PremiumFull selectBusinessDetail(PremiumFull pref) {
		return adminDao.selectBusinessDetail(mybatisSession, pref);
	}

	@Override
	public int selectCountPremium() {
		return adminDao.selectCountPremium(mybatisSession);
	}

	@Override
	public ArrayList<PremiumFull> selectPremiumList(Apaging page) {
		return adminDao.selectPremiumList(mybatisSession, page);
	}

	@Override
	public ArrayList<PremiumFull> selectBusinessList(Apaging page) {
		return adminDao.selectBusinessList(mybatisSession, page);
	}

	@Override
	public int updateBusinessStatus(PremiumFull pfull) {
		return adminDao.updateBusinessStatus(mybatisSession, pfull);
	}

	@Override
	public ArrayList<User> selectUserList(Apaging page) {
		return adminDao.selectUserList(mybatisSession, page);
	}

	@Override
	public int updateUserStatus(PremiumFull pfull) {
		return adminDao.updateUserStatus(mybatisSession, pfull);
	}

	@Override
	public int updateUserReasonLeave(PremiumFull pfull) {
		return adminDao.updateUserReasonLeave(mybatisSession, pfull);
	}

	@Override
	public ArrayList<Report> selectReportList(Apaging page) {
		return adminDao.selectReportList(mybatisSession, page);
	}

	@Override
	public Report selectReportDetail(Report report) {
		return adminDao.selectReportDetail(mybatisSession, report);
	}

	@Override
	public int updateReportStatus(Report report) {
		return adminDao.updateReportStatus(mybatisSession, report);
	}

	@Override
	public PremiumFull selectUserDetail(String user_id) {
		return adminDao.selectUserDetail(mybatisSession, user_id);
	}

	@Override
	public int selectCountBUser() {
		return adminDao.selectCountBUser(mybatisSession);
	}

	@Override
	public int updateContentsStatus(Report report) {
		return adminDao.updateContentsStatus(mybatisSession, report);
	}

	@Override
	public int updateGuide(Guide guide) {
		return adminDao.updateGuide(mybatisSession, guide);
	}
	
}
