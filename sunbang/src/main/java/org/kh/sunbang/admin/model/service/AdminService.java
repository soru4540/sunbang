package org.kh.sunbang.admin.model.service;

import java.util.ArrayList;
import org.kh.sunbang.admin.model.vo.Report;

public interface AdminService {

	ArrayList<Report> selectUnHandledList();

}
