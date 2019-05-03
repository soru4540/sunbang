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
	public ArrayList<Chat> selectListFilterChat() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Chat> selectMyListFilterChat() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCheckChat(int chat_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMessage(Message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMessage(int message_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Message> selectListMessage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ChatBlock> selectMylistChatBlock() {
		// TODO Auto-generated method stub
		return null;
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
