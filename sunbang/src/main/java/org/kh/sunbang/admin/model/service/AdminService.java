package org.kh.sunbang.admin.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Apaging;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.user.model.vo.User;

public interface AdminService {

	ArrayList<Report> selectUnHandledList();

	ArrayList<Guide> selectGuideAllList(String guide_system);
	
	int guideInsert(Guide guide);

	ArrayList<Guide> selectGuideList(String category);

	Guide selectGuideDetail(int guide_no);

	int deleteGuide(int guide_no);

	int selectListCount();

	PremiumFull selectBusinessDetail(PremiumFull pref);

	int selectCountPremium();

	ArrayList<PremiumFull> selectPremiumList(Apaging page);

	ArrayList<PremiumFull> selectBusinessList(Apaging page);

	int updateBusinessStatus(PremiumFull pfull);

	ArrayList<User> selectUserList(Apaging page);

	int updateUserStatus(PremiumFull pfull);

	int updateUserReasonLeave(PremiumFull pfull);

	ArrayList<Report> selectReportList(Apaging page);

	Report selectReportDetail(Report report);

	int updateReportStatus(Report report);

	PremiumFull selectUserDetail(String user_id);

	int selectCountBUser();

	int updateContentsStatus(Report report);

	int updateGuide(Guide guide);

	int selectCountChat();
	
}
