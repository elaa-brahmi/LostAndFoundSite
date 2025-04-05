package services.messageDao;

import model.Conversation;
import model.Message;

import java.util.List;

public class ConversationImpl implements ConversationInter{

    @Override
    public Conversation getConversation(Integer conversationId) {
        return ConversationDao.getConversation(conversationId);
    }

    @Override
    public List<Conversation> getAllConversationsByUser(Integer userId) {
        return ConversationDao.getAllConversationsByUser(userId) ;
    }

    @Override
    public void addConversationToUser( Integer userId1, Integer userId2) {
        ConversationDao.addConversationToUser(userId1,userId2);

    }

    @Override
    public void removeConversation(Integer conversationid) {
        ConversationDao.delete(conversationid);
    }

    @Override
    public List<Message> getAllMessagesByConversation(Integer conversationId) {
        return ConversationDao.getAllMessagesByConversation(conversationId);
    }
}
