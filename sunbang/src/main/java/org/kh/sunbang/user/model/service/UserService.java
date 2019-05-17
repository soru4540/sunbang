package org.kh.sunbang.user.model.service;

import java.util.ArrayList;

import org.kh.sunbang.interior.model.vo.Board;
import org.kh.sunbang.interior.model.vo.Like;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.User;

public interface UserService {
	
	User selectLoginId(User user);
	User selectLoginPwd(User user);
	int insertUser(User user);
	String selectFindId(User user);
	String selectFIndPwd(User user);
	int updateUser(User user);
	int selectCheckId(String user_id);
	ArrayList<String> selectOfficeName();
	int selectCheckLicense(String license);
	User selectMyUser(int user_no);
	int updatePwd(String password);
	int updateUserOut(int user_no);
	String updatePremium(int business_user_no);
	ArrayList<Realty> selectMyDibs(int user_no);
	ArrayList<Board> selectMyLike(int user_no);
	int updateDibsMemo(int dibs_no);
	int updateLoginNum(User user);
	/*int deleteDibs(Dibs dibs);*/
	int deleteLike(Like like);
	
	//김성현----------------------------------------------------
	int insertPremium(Premium premium);
	
}
