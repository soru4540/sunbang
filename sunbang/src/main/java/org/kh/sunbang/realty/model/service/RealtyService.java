package org.kh.sunbang.realty.model.service;

import java.util.ArrayList;

import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.realty.model.vo.Realty;

public interface RealtyService {
	
	//성현---------------------------------------------------------------------------------------------------------------------	
	Realty selectRealtyDetailView(int realty_no);
	
	int selectDibsCount(int realty_no);
	int selectDibsCheck(Dibs dibs);
	int deleteDibs(Dibs dibs);
	int insertDibs(Dibs dibs);
	int selectRealtyReportCheck(Report report);
	int insertRealtyReport(Report report);
	void updateRealtyHits(int realty_no);
	
	int insertRealty(Realty realty);
	
	ArrayList<Realty> selectRealtyMyListView(int user_no);
	int updateRealtyMyListDelete(Realty realty);
	
	int updateRealtyStatus(Realty realty);
	int updateRealty(Realty realty);
	
	//형진---------------------------------------------------------------------------------------------------------------
	
	ArrayList<Realty> selectMarkerList();
	ArrayList<Realty> selectRealtyList(ArrayList<Integer> realtyno);

}
