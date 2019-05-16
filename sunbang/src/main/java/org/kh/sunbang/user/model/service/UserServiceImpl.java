package org.kh.sunbang.user.model.service;

import java.util.ArrayList;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.dao.UserDao;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private UserDao userDao;

	@Override
	public User selectLoginId(User user) {
		return userDao.selectLoginId(mybatisSession, user);
	}

	@Override
	public User selectLoginPwd(User user) {
		return userDao.selectLoginPwd(mybatisSession, user);
	}

	@Override
	public int updateLoginNum(User user) {
		return userDao.updateLoginNum(mybatisSession, user);
	}
	
	@Override
	public User insertUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectFindId(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectFIndPwd(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectCheckId(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<String> selectOfficeName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCheckLicense(String license) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User selectMyUser(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePwd(String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserOut(int user_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String updatePremium(int business_user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Realty> selectMyDibs(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectMyLike(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDibsMemo(int dibs_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*@Override
	public int deleteDibs(Dibs dibs) {
		// TODO Auto-generated method stub
		return 0;
	}*/

	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//김성현--------------------------------------------------------------
	@Override
	public int insertPremium(Premium premium) { //결제 등록
		return userDao.insertPremium(mybatisSession, premium);
	}

}
