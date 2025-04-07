package services.messageDao;

import model.Conversation;
import model.Message;

import java.util.List;
import java.util.Map;

public class ConversationImpl implements ConversationInter{

    @Override
    public Conversation getConversation(Integer conversationId) {
        return ConversationDao.getConversation(conversationId);
    }

    @Override
    public List<Map<String, Object>> getAllConversationsByUser(Integer userId) {
        return ConversationDao.getAllConversationsByUser(userId) ;
    }

    @Override
    public int addConversationToUser( Integer userId1, Integer userId2) {
        return ConversationDao.addConversationToUser(userId1,userId2);

    }

    @Override
    public void removeConversation(Integer conversationid) {
        ConversationDao.delete(conversationid);
    }



    @Override
    public void updateConvoStatus(Integer conversationId, String convoStatus) {
        ConversationDao.updateConvoStatus( conversationId,  convoStatus);

    }

    @Override
    public Message getLastMessageByConversationId(int conversationId) {
        return ConversationDao.getLastMessageByConversationId(conversationId);
    }
}
