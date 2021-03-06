package org.kh.sunbang.user.model.service;

import java.util.ArrayList;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.Uboard;
import org.kh.sunbang.user.model.vo.Urealty;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;

public interface UserService {
	
	User selectLoginId(User user);
	User selectLoginPwd(User user);
	int insertUser(User user);
	String selectFindId(User user);
	User selectUpdateLogin(User user);
	User selectFindPwd(User user);
	int updateUser(User user);
	int selectCheckId(String user_id);
	int selectCheckNick(String nickname);
	ArrayList<String> selectOfficeName();
	int selectCheckLicense(String license);
	Premium selectMyUser(int business_user_no);
	int updatePwd(User user);
	int updateUserOut(User user);
	int updatePremium(int charge_no);
	ArrayList<Urealty> selectMyDibs(int user_no);
	ArrayList<Uboard> selectMyLike(int user_no);
	int updateDibsMemo(Dibs dibs);
	int updateLoginNum(User user);
	int deleteDibs(int dibs_no);
	int deleteLike(int like_no);
	int updateUserPremium(int business_user_no);
	
	//김성현----------------------------------------------------
	int insertPremium(Premium premium);
	int updatePremiumStatus(int business_user_no);
	User selectUserNo(int business_user_no);
	
}
