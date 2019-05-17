package org.kh.sunbang.user.model.dao;

import java.util.ArrayList;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao {

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	public User selectLoginId(SqlSessionTemplate session, User user) {
		return session.selectOne("userMapper.selectLoginId", user); 
	}

	
	public User selectLoginPwd(SqlSessionTemplate session, User user) {
		return session.selectOne("userMapper.selectLoginPwd", user); 
	}

	
	public int updateLoginNum(SqlSessionTemplate session, User user) {
		return session.update("userMapper.updateLoginNum", user); 
	}
	
	
	public int insertUser(SqlSessionTemplate session, User user) {
		return session.insert("userMapper.insertUser", user); 
	}

	
	public String selectFindId(SqlSessionTemplate session, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public String selectFIndPwd(SqlSessionTemplate session, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int updateUser(SqlSessionTemplate session, User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int selectCheckId(SqlSessionTemplate session, String user_id) {
		return session.selectOne("userMapper.selectCheckId", user_id); 
	}

	
	public ArrayList<String> selectOfficeName(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int selectCheckLicense(SqlSessionTemplate session, String license) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public User selectMyUser(SqlSessionTemplate session, int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int updatePwd(SqlSessionTemplate session, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int updateUserOut(SqlSessionTemplate session, int user_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public String updatePremium(SqlSessionTemplate session, int business_user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public ArrayList<Realty> selectMyDibs(SqlSessionTemplate session, int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public ArrayList<Board> selectMyLike(SqlSessionTemplate session, int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int updateDibsMemo(SqlSessionTemplate session, int dibs_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	public int deleteDibs(SqlSessionTemplate session, Dibs dibs) {
		// TODO Auto-generated method stub
		return 0;
	}*/

	
	public int deleteLike(SqlSessionTemplate session, Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//성현------------------------------------
	public int insertPremium(SqlSessionTemplate mybatisSession, Premium premium) {
		return mybatisSession.insert("userMapper.insertPremium", premium);
	}
}
