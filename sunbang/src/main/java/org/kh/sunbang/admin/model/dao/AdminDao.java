package org.kh.sunbang.admin.model.dao;

import java.util.List;
import org.kh.sunbang.admin.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {

	public List<Report> selectUnHandledList(SqlSessionTemplate mybatisSession) {
		return mybatisSession.selectList("reportMapper.selectUnHandledList");
	}

}
