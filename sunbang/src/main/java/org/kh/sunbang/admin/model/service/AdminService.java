package org.kh.sunbang.admin.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;

public interface AdminService {

	ArrayList<Report> selectUnHandledList();

	ArrayList<Guide> selectGuideAllList(String guide_system);
	
	int guideInsert(Guide guide);

	ArrayList<Guide> selectGuideList(String category);

	Guide selectGuideDetail(int guide_no);

	int deleteGuide(int guide_no);

	ArrayList<PremiumFull> selectPremiumList(int currentPage, int limit);

	int selectListCount();

	PremiumFull selectBusinessDetail(int business_user_no);

}
