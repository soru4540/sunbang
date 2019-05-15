package org.kh.sunbang.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
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
		System.out.println("guideInsert Dao 접속");
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
		System.out.println("deleteGuide Dao 접속");
		int result = mybatisSession.update("adminMapper.deleteGuide", guide_no);
		return result;
	}

	public int selectListCount(SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.selectOne("adminMapper.selectListCount");
		return result;
	}

	public ArrayList<PremiumFull> selectPremiumList(SqlSessionTemplate mybatisSession, int currentPage, int limit) {
		RowBounds rowBounds = new RowBounds(currentPage, limit);
		List<PremiumFull> plist = mybatisSession.selectList("adminMapper.selectPremiumList", rowBounds);
		return (ArrayList<PremiumFull>)plist;
	}

	public PremiumFull selectBusinessDetail(SqlSessionTemplate mybatisSession, int business_user_no) {
		PremiumFull pref = mybatisSession.selectOne("adminMapper.selectBusinessDetail",business_user_no);
		return pref;
	}

}
