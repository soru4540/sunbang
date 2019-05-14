package org.kh.sunbang.chat.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;

public interface ChatService {

	String insertChat(Chat chat);
	int deleteChat(int chat_no);
	ArrayList<Chat> selectListFilterChat();
	ArrayList<Chat> selectMyListFilterChat(int userno);
	int selectCheckChat(int chat_no);
	int insertMessage(Message message);
	int deleteMessage(int message_no);
	ArrayList<Message> selectListMessage(int chatno);
	ArrayList<ChatBlock> selectMylistChatBlock(int userno);
	String insertChatBlock(ChatBlock chatBlock);
	String deleteChatBlock(int block_no);
	String updateJoin(Chat chat);
	String updateAway(Chat chat);
	String updateAlert(Chat chat);
	ArrayList<Chat> selectListChatUser(int chatno);
	int insertMessageImg(Message message);
	int insertMessageFile(Message message);
	
	
}
