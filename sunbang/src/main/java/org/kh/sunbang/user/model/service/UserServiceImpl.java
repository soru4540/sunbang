package org.kh.sunbang.user.model.service;

import java.util.ArrayList;

import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.dao.UserDao;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.Uboard;
import org.kh.sunbang.user.model.vo.Urealty;
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
	public User selectUpdateLogin(User user) {
		return userDao.selectUpdateLogin(mybatisSession, user);
	}

	@Override
	public int updateLoginNum(User user) {
		return userDao.updateLoginNum(mybatisSession, user);
	}
	
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(mybatisSession, user);
	}

	@Override
	public String selectFindId(User user) {
		System.out.println(userDao.selectFindId(mybatisSession, user));
		return userDao.selectFindId(mybatisSession, user);
	}

	@Override
	public User selectFindPwd(User user) {
		return userDao.selectFindPwd(mybatisSession, user);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(mybatisSession, user);
	}

	@Override
	public int selectCheckId(String user_id) {
		return userDao.selectCheckId(mybatisSession, user_id);
	}
	
	@Override
	public int selectCheckNick(String nickname) {
		return userDao.selectCheckNick(mybatisSession, nickname);
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
	public Premium selectMyUser(int business_user_no) {
		return userDao.selectMyUser(mybatisSession, business_user_no);
	}

	@Override
	public int updatePwd(User user) {
		return userDao.updatePwd(mybatisSession, user);
	}

	@Override
	public int updateUserOut(User user) {
		return userDao.updateUserOut(mybatisSession, user);
	}

	@Override
	public int updatePremium(int charge_no) {
		return userDao.updatePremium(mybatisSession, charge_no);
	}

	@Override
	public ArrayList<Urealty> selectMyDibs(int user_no) {
		return userDao.selectMyDibs(mybatisSession, user_no);
	}

	@Override
	public ArrayList<Uboard> selectMyLike(int user_no) {
		return userDao.selectMyLike(mybatisSession, user_no);
	}

	@Override
	public int updateDibsMemo(Dibs dibs) {
		return userDao.updateDibsMemo(mybatisSession, dibs);
	}

	@Override
	public int deleteDibs(int dibs_no) {
		return userDao.deleteDibs(mybatisSession, dibs_no);
	}

	@Override
	public int deleteLike(int like_no) {
		return userDao.deleteLike(mybatisSession, like_no);
	}
	
	@Override
	public int updateUserPremium(int business_user_no) {
		return userDao.updateUserPremium(mybatisSession, business_user_no);
	}
	
	//김성현--------------------------------------------------------------
	@Override
	public int insertPremium(Premium premium) { //결제 등록
		return userDao.insertPremium(mybatisSession, premium);
	}

	@Override
	public int updatePremiumStatus(int business_user_no) { //결제 상태 바꾸기 (N->Y)
		return userDao.updatePremiumStatus(mybatisSession, business_user_no);
	}

	@Override
	public User selectUserNo(int business_user_no) { //결제 후 세션 reload
		return userDao.selectUserNo(mybatisSession, business_user_no);
	}


}
