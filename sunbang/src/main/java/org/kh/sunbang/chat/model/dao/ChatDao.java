package org.kh.sunbang.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.chat.model.vo.Chat;
import org.kh.sunbang.chat.model.vo.ChatBlock;
import org.kh.sunbang.chat.model.vo.Message;
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
	
	public ArrayList<Message> selectListMessage(SqlSessionTemplate session, int chatno){
		List<Message> list = session.selectList("chatMapper.selectListMessage", chatno);
		return (ArrayList<Message>)list;
	}
	
	public ArrayList<Chat> selectListChatUser(SqlSessionTemplate session, int chatno) {
		List<Chat> list = session.selectList("chatMapper.selectListChatUser", chatno);
		return (ArrayList<Chat>)list;
	};
	
	public String insertChat(SqlSessionTemplate session, Chat chat){
		return null;};
	
	public int deleteChat(SqlSessionTemplate session, int chat_no){
		return chat_no;};
	
	public int selectCheckChat(SqlSessionTemplate session, int chat_no){
		return chat_no;};
	
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
		return session.delete("chatMapper.deleteMessage", message_no);};
	
	public ArrayList<ChatBlock> selectMylistChatBlock(SqlSessionTemplate session, int userno){
		List<ChatBlock> list = session.selectList("chatMapper.selectMylistChatBlock", userno);
		return (ArrayList<ChatBlock>)list;
		}
	
	public String insertChatBlock(SqlSessionTemplate session, ChatBlock chatBlock){
		return null;};
	
	public String deleteChatBlock(SqlSessionTemplate session, int block_no){
		return null;};
	
	public String updateJoin(SqlSessionTemplate session, Chat chat){
		return null;};
	
	public String updateAway(SqlSessionTemplate session, Chat chat){
		return null;};
	
	public String updateAlert(SqlSessionTemplate session, Chat chat){
		return null;}



}
