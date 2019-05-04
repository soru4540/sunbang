package org.kh.sunbang.realty.model.service;

import java.util.ArrayList;

import org.kh.sunbang.realty.model.vo.Realty;

public interface RealtyService {
	Realty selectRealtyDetailView(int realty_no);
	void updateRealtyHits(int realty_no);
	ArrayList<Realty> selectMarkerList();
}
