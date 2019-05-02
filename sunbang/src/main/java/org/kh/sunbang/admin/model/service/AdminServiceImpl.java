package org.kh.sunbang.admin.model.service;

import java.util.ArrayList;
import org.kh.sunbang.admin.model.dao.AdminDao;
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
		return (ArrayList<Report>) adminDao.selectUnHandledList(mybatisSession);
	}
	
	
}
