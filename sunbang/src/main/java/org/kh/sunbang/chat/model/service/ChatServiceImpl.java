package org.kh.sunbang.chat.model.service;

import java.util.ArrayList;

import org.kh.sunbang.chat.model.dao.ChatDao;
import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
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
	public ArrayList<Chat> selectMyListFilterChat(int userno) {
		return chatDao.selectMyListFilterChat(mybatisSession, userno);
	}
	
	@Override
	public ArrayList<Message> selectListMessage(int chatno) {
		return chatDao.selectListMessage(mybatisSession, chatno);
	}
	
	@Override
	public String insertChat(Chat chat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteChat(int chat_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectCheckChat(int chat_no) {
		// TODO Auto-generated method stub
		return 0;
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
	public ArrayList<Chat> selectListChatUser(int chatno) {
		return chatDao.selectListChatUser(mybatisSession, chatno);
	}

	@Override
	public String insertChatBlock(ChatBlock chatBlock) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteChatBlock(int block_no) {
		// TODO Auto-generated method stub
		return null;
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
