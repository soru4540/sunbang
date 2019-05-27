package org.kh.sunbang.admin.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.kh.sunbang.admin.model.vo.Apaging;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {

	public ArrayList<Report> selectUnHandledList(SqlSessionTemplate mybatisSession) {
		List<Report> list = mybatisSession.selectList("adminMapper.selectUnHandledList");
		return (ArrayList<Report>) list;
	}

	public ArrayList<Guide> selectGuideAllList(SqlSessionTemplate mybatisSession, String guide_system) {
		List<Guide> list = mybatisSession.selectList("adminMapper.selectGuideAllList", guide_system);
		return (ArrayList<Guide>) list;
	}

	public int guideInsert(SqlSessionTemplate mybatisSession, Guide guide) {
		int result = mybatisSession.insert("adminMapper.guideInsert", guide);
		return result;
	}

	public ArrayList<Guide> selectGuideList(SqlSessionTemplate mybatisSession, String category) {
		List<Guide> list = mybatisSession.selectList("adminMapper.selectGuideList", category);
		return (ArrayList<Guide>) list;
	}

	public Guide selectGuideDetail(SqlSessionTemplate mybatisSession, int guide_no) {
		Guide guide = mybatisSession.selectOne("adminMapper.selectGuideDetail", guide_no);
		return guide;
	}

	public int deleteGuide(SqlSessionTemplate mybatisSession, int guide_no) {
		int result = mybatisSession.update("adminMapper.deleteGuide", guide_no);
		return result;
	}

	public int selectListCount(SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.selectOne("adminMapper.selectListCount");
		return result;
	}

	public PremiumFull selectBusinessDetail(SqlSessionTemplate mybatisSession, PremiumFull pref) {
		pref = mybatisSession.selectOne("adminMapper.selectBusinessDetail",pref);
		return pref;
	}

	public int selectCountPremium(SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.selectOne("adminMapper.selectCountPremium");
		return result;
	}

	public ArrayList<PremiumFull> selectPremiumList(SqlSessionTemplate mybatisSession, Apaging page) {
		List<PremiumFull> plist = mybatisSession.selectList("adminMapper.selectPremiumList", page);
		return (ArrayList<PremiumFull>)plist;
	}

	public ArrayList<PremiumFull> selectBusinessList(SqlSessionTemplate mybatisSession, Apaging page) {
		List<PremiumFull> blist = mybatisSession.selectList("adminMapper.selectBusinessList", page);
		return (ArrayList<PremiumFull>)blist;
	}

	public int updateBusinessStatus(SqlSessionTemplate mybatisSession, PremiumFull pfull) {
		int result = mybatisSession.update("adminMapper.updateBusinessStatus", pfull);
		return result;
	}

	public ArrayList<User> selectUserList(SqlSessionTemplate mybatisSession, Apaging page) {
		List<User> ulist= mybatisSession.selectList("adminMapper.selectUserList", page);
		return (ArrayList<User>)ulist;
	}

	public int updateUserStatus(SqlSessionTemplate mybatisSession, PremiumFull pfull) {
		int result = mybatisSession.update("adminMapper.updateUserStatus", pfull);
		return result;
	}

	public int updateUserReasonLeave(SqlSessionTemplate mybatisSession, PremiumFull pfull) {
		int result = mybatisSession.update("adminMapper.updateUserReasonLeave", pfull);
		return result;
	}

	public ArrayList<Report> selectReportList(SqlSessionTemplate mybatisSession, Apaging page) {
		List<Report> relist= mybatisSession.selectList("adminMapper.selectReportList", page);
		return (ArrayList<Report>)relist;
	}

	public Report selectReportDetail(SqlSessionTemplate mybatisSession, Report report) {
		report = mybatisSession.selectOne("adminMapper.selectReportDetail", report);
		return report;
	}

	public int updateReportStatus(SqlSessionTemplate mybatisSession, Report report) {
		int result = mybatisSession.update("adminMapper.updateReportStatus", report);
		return result;
	}

	public PremiumFull selectUserDetail(SqlSessionTemplate mybatisSession, String user_id) {
		PremiumFull pref = mybatisSession.selectOne("adminMapper.selectUserDetail", user_id);
		return pref;
	}

	public int selectCountBUser(SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.selectOne("adminMapper.selectCountBUser");
		return result;
	}

	public int updateContentsStatus(SqlSessionTemplate mybatisSession, Report report) {
		int result = mybatisSession.update("adminMapper.updateContentsStatus", report);
		return result;
	}

	public int updateGuide(SqlSessionTemplate mybatisSession, Guide guide) {
		int result = mybatisSession.update("adminMapper.updateGuide", guide);
		return result;
	}

	public int deleteUser(SqlSessionTemplate mybatisSession, int user_no) {
		int result = mybatisSession.delete("adminMapper.deleteUser", user_no);
		return result;
	}

}
