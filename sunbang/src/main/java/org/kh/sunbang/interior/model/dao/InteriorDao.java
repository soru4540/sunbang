package org.kh.sunbang.interior.model.dao;

import org.springframework.stereotype.Repository;
import org.kh.sunbang.interior.model.vo.BoardFull;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("interiorDao")
public class InteriorDao {

	public BoardFull selectHbTop1(SqlSessionTemplate session) {	
		return session.selectOne("interiorMapper.selectHbTop1");
	}

}
