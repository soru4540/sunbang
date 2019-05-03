package org.kh.sunbang.chat.model.service;

import java.util.ArrayList;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;

public interface ChatService {

	String insertChat(Chat chat);
	int deleteChat(int chat_no);
	ArrayList<Chat> selectListFilterChat();
	ArrayList<Chat> selectMyListFilterChat();
	int selectCheckChat(int chat_no);
	int insertMessage(Message message);
	int deleteMessage(int message_no);
	ArrayList<Message> selectListMessage();
	ArrayList<ChatBlock> selectMylistChatBlock();
	String insertChatBlock(ChatBlock chatBlock);
	String deleteChatBlock(int block_no);
	String updateJoin(Chat chat);
	String updateAway(Chat chat);
	String updateAlert(Chat chat);
	
	
}
