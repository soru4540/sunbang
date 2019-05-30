package org.kh.sunbang.chat.model.service;

import java.util.ArrayList;

import org.kh.sunbang.chat.model.dao.ChatDao;
import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ChatDao chatDao;

	@Override
	public ArrayList<Chat> selectListFilterChat() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int selectOpenAdmin(int user_no) {
		return chatDao.selectOpenAdmin(mybatisSession, user_no);
	}

	@Override
	public ArrayList<Chat> selectMyListFilterChat(int userno) {
		return chatDao.selectMyListFilterChat(mybatisSession, userno);
	}
	
	@Override
	public ArrayList<Message> selectListMessage(Chat chat) {
		return chatDao.selectListMessage(mybatisSession, chat);
	}
	
	@Override
	public int insertChat(Chat chat) {
		return chatDao.insertChat(mybatisSession, chat);
	}

	@Override
	public int deleteChat(Chat chat) {
		return chatDao.deleteChat(mybatisSession, chat);
	}

	@Override
	public int insertMessage(Message message) {
		return chatDao.insertMessage(mybatisSession, message);
	}
	
	@Override
	public int insertMessageImg(Message message) {
		return chatDao.insertMessageImg(mybatisSession, message);
	}
	
	@Override
	public int insertMessageFile(Message message) {
		return chatDao.insertMessageFile(mybatisSession, message);
	}

	@Override
	public int deleteMessage(int message_no) {
		return chatDao.deleteMessage(mybatisSession, message_no);
	}

	@Override
	public ArrayList<ChatBlock> selectMylistChatBlock(int userno) {
		return chatDao.selectMylistChatBlock(mybatisSession, userno);
	}
	
	@Override
	public ArrayList<Chat> selectListChatUser(Chat chat) {
		return chatDao.selectListChatUser(mybatisSession, chat);
	}

	@Override
	public int insertChatBlock(ChatBlock chatBlock) {
		return chatDao.insertChatBlock(mybatisSession, chatBlock);
	}

	@Override
	public int deleteChatBlock(ChatBlock chatBlock) {
		return chatDao.deleteChatBlock(mybatisSession, chatBlock);
	}
	
	@Override
	public Chat selectCheckChat(Chat chat) {
		return chatDao.selectCheckChat(mybatisSession, chat);
	}

	@Override
	public User selectUserChat(String nickname, String check) {
		return chatDao.selectUserChat(mybatisSession, nickname, check);
	}
	
	@Override
	public int insertUserChat(Chat chat) {
		return chatDao.insertUserChat(mybatisSession, chat);
	}
	
	@Override
	public Chat selectChatChatCheck(Chat chat) {
		return chatDao.selectChatChatCheck(mybatisSession, chat);
	}
	
	@Override
	public int insertTeamChat(Chat chat) {
		return chatDao.insertTeamChat(mybatisSession, chat);
	}


	@Override
	public String updateJoin(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateAway(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateAlert(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}






}
