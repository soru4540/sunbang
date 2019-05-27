package org.kh.sunbang.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.Uboard;
import org.kh.sunbang.user.model.vo.Urealty;
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
		User loginUser = session.selectOne("userMapper.selectLoginPwd", user);
		if(!bcryptPasswordEncoder.matches(user.getPassword(), loginUser.getPassword())) {
			loginUser = null;
		}
		return loginUser;
	}
	
	public User selectUpdateLogin(SqlSessionTemplate session, User user) {
		User loginUser = session.selectOne("userMapper.selectLoginPwd", user);
		return loginUser;
	}


	
	public int updateLoginNum(SqlSessionTemplate session, User user) {
		session.update("userMapper.updateLoginNum", user);
		return session.selectOne("userMapper.selectLoginNum", user);
	}
	
	
	public int insertUser(SqlSessionTemplate session, User user) {
		int result =  session.insert("userMapper.insertUser", user);
		if(!user.getUser_type().equals("일반회원")) {
		result =  session.insert("userMapper.binsertUser", user);
		}
		session.insert("chatMapper.insertaChat", user);
		session.insert("chatMapper.insertbChat");
		
		return result;
	}

	
	public String selectFindId(SqlSessionTemplate session, User user) {
		return session.selectOne("userMapper.selectFindId", user); 
	}

	
	public User selectFindPwd(SqlSessionTemplate session, User user) {
		User result= session.selectOne("userMapper.selectFindPwd", user);
		return result; 
	}

	
	public int updateUser(SqlSessionTemplate session, User user) {
		int result =  session.update("userMapper.updateUser", user);
		if(user.getUser_type().equals("공인중개사")) {
		result =  session.update("userMapper.bupdateUser", user);
		}
		return result;
	}

	
	public int selectCheckId(SqlSessionTemplate session, String user_id) {
		return session.selectOne("userMapper.selectCheckId", user_id); 
	}
	
	public int selectCheckNick(SqlSessionTemplate session, String nickname) {
		return session.selectOne("userMapper.selectCheckNick", nickname); 
	}
	
	public ArrayList<String> selectOfficeName(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int selectCheckLicense(SqlSessionTemplate session, String license) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public Premium selectMyUser(SqlSessionTemplate session, int business_user_no) {
		return session.selectOne("userMapper.selectMyUser", business_user_no); 
	}

	
	public int updatePwd(SqlSessionTemplate session, User user) {
		return session.update("userMapper.updatePwd", user); 
	}

	
	public int updateUserOut(SqlSessionTemplate session, User user) {
		return session.update("userMapper.updateUserOut", user); 
	}

	
	public int updatePremium(SqlSessionTemplate session, int charge_no) {
		return session.update("userMapper.updatePremium", charge_no); 
	}

	
	public ArrayList<Urealty> selectMyDibs(SqlSessionTemplate session, int user_no) {
		List<Urealty> list =  session.selectList("userMapper.selectMyDibs", user_no); 
		return (ArrayList<Urealty>)list;
	}

	
	public ArrayList<Uboard> selectMyLike(SqlSessionTemplate session, int user_no) {
		List<Uboard> list =  session.selectList("userMapper.selectMyLike", user_no); 
		return (ArrayList<Uboard>)list;
	}

	
	public int updateDibsMemo(SqlSessionTemplate session, Dibs dibs) {
		return session.update("userMapper.updateDibsMemo", dibs); 
	}

	
	public int deleteDibs(SqlSessionTemplate session, int dibs_no) {
		return session.delete("userMapper.deleteDibs", dibs_no); 
	}

	
	public int deleteLike(SqlSessionTemplate session, int like_no) {
		return session.delete("userMapper.deleteLike", like_no); 
	}
	
	public int updateUserPremium(SqlSessionTemplate session, int business_user_no) {
		return session.update("userMapper.updateUserPremium", business_user_no); 
	}

	
	//성현------------------------------------
	public int insertPremium(SqlSessionTemplate mybatisSession, Premium premium) {
		return mybatisSession.insert("userMapper.insertPremium", premium);
	}


	public int updatePremiumStatus(SqlSessionTemplate mybatisSession, int business_user_no) {
		return mybatisSession.insert("userMapper.updatePremiumStatus", business_user_no);
	}


	public User selectUserNo(SqlSessionTemplate mybatisSession, int business_user_no) {
		return mybatisSession.selectOne("userMapper.selectUserNo", business_user_no);
	}

}
