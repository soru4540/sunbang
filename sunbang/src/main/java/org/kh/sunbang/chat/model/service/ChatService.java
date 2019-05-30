package org.kh.sunbang.chat.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
import org.kh.sunbang.user.model.vo.User;

public interface ChatService {

	int insertChat(Chat chat);
	int deleteChat(Chat chat);
	ArrayList<Chat> selectListFilterChat();
	ArrayList<Chat> selectMyListFilterChat(int userno);
	int insertMessage(Message message);
	int deleteMessage(int message_no);
	ArrayList<Message> selectListMessage(Chat chat);
	ArrayList<ChatBlock> selectMylistChatBlock(int userno);
	int insertChatBlock(ChatBlock chatBlock);
	int deleteChatBlock(ChatBlock chatBlock);
	String updateJoin(Chat chat);
	String updateAway(Chat chat);
	String updateAlert(Chat chat);
	ArrayList<Chat> selectListChatUser(Chat chat);
	int insertMessageImg(Message message);
	int insertMessageFile(Message message);
	Chat selectCheckChat(Chat chat_no);
	User selectUserChat(String nickname);
	int insertUserChat(Chat chat);
	Chat selectChatChatCheck(Chat chat);
	int insertTeamChat(Chat chat);
	int selectOpenAdmin(int user_no);
	
	
}
