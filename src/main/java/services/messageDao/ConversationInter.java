package services.messageDao;

import model.Conversation;
import model.Message;

import java.util.List;

public interface ConversationInter {
    public Conversation getConversation(Integer conversationId);
    public List<Conversation> getAllConversationsByUser(Integer userId);
    public int addConversationToUser(Integer userId1,Integer userId2);
    public void removeConversation(Integer conversationId);
    public List<Message> getAllMessagesByConversation(Integer conversationId);
    public void updateConvoStatus(Integer conversationId, String convoStatus);

}
