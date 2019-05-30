package org.kh.sunbang.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
import org.kh.sunbang.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("chatDao")
public class ChatDao {

	public ArrayList<Chat> selectListFilterChat(SqlSessionTemplate session){
		return null;};
	
	public ArrayList<Chat> selectMyListFilterChat(SqlSessionTemplate session, int userno){
		List<Chat> list = session.selectList("chatMapper.selectMyListFilterChat", userno);
		return (ArrayList<Chat>)list;
	}
	
	public ArrayList<Message> selectListMessage(SqlSessionTemplate session, Chat chat){
		List<Message> list = session.selectList("chatMapper.selectListMessage", chat);
		return (ArrayList<Message>)list;
	}
	
	public ArrayList<Chat> selectListChatUser(SqlSessionTemplate session, Chat chat) {
		List<Chat> list = session.selectList("chatMapper.selectListChatUser", chat);
		return (ArrayList<Chat>)list;
	};
	
	public int insertChat(SqlSessionTemplate session, Chat chat){
		return session.insert("chatMapper.insertChat", chat);
		}
	
	public int deleteChat(SqlSessionTemplate session, Chat chat){
		return session.delete("chatMapper.deleteChat", chat);
		}
	
	public Chat selectCheckChat(SqlSessionTemplate session, Chat chat){
		Chat chat1 =null;
		if(chat.getChat_type().equals("부동산")) {
		chat1 = session.selectOne("chatMapper.selectCheckChat", chat);
		}
		if(chat.getChat_type().equals("관리자")) {
		chat1 = session.selectOne("chatMapper.selectCheckChat", chat);	
		}
		return chat1;
	}
	
	public int insertMessage(SqlSessionTemplate session, Message message){
		return session.insert("chatMapper.insertMessage", message);
	}
	
	public int insertMessageImg(SqlSessionTemplate session, Message message) {
		return session.insert("chatMapper.insertMessageImg", message);
	}
	
	public int insertMessageFile(SqlSessionTemplate session, Message message) {
		return session.insert("chatMapper.insertMessageFile", message);
	}
	
	public int deleteMessage(SqlSessionTemplate session, int message_no){
		return session.delete("chatMapper.deleteMessage", message_no);
		}
	
	public ArrayList<ChatBlock> selectMylistChatBlock(SqlSessionTemplate session, int userno){
		List<ChatBlock> list = session.selectList("chatMapper.selectMylistChatBlock", userno);
		return (ArrayList<ChatBlock>)list;
		}
	
	public int insertChatBlock(SqlSessionTemplate session, ChatBlock chatBlock){
		return session.insert("chatMapper.insertChatBlock", chatBlock);
		}
	
	public int deleteChatBlock(SqlSessionTemplate session, ChatBlock chatBlock){
		return session.delete("chatMapper.deleteChatBlock", chatBlock);
		}
	
	public User selectUserChat(SqlSessionTemplate session, String nickname) {
		return session.selectOne("chatMapper.selectUserChat", nickname);	
	}
	
	public int insertUserChat(SqlSessionTemplate session, Chat chat) {
		session.insert("chatMapper.insertUserChat", chat);
		return session.insert("chatMapper.inserttwoUserChat", chat);
		
	}
	
	public int insertTeamChat(SqlSessionTemplate session, Chat chat) {
		return session.insert("chatMapper.insertTeamChat", chat);
	}
	
	public String updateJoin(SqlSessionTemplate session, Chat chat){
		return null;};
	
	public String updateAway(SqlSessionTemplate session, Chat chat){
		return null;};
	
	public String updateAlert(SqlSessionTemplate session, Chat chat){
		return null;}

	public Chat selectChatChatCheck(SqlSessionTemplate session, Chat chat) {
		Chat result = session.selectOne("chatMapper.selectChatChatCheck", chat);
		if(result == null) {
			session.insert("chatMapper.insertChatChatCheck", chat);
		}
		return result;
	}

	public int selectOpenAdmin(SqlSessionTemplate session, int user_no) {
		return session.selectOne("chatMapper.selectOpenAdmin", user_no);	
	}






}
