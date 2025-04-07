package services.messageDao;

import model.Conversation;
import model.Message;

import java.util.List;
import java.util.Map;

public interface ConversationInter {
    public Conversation getConversation(Integer conversationId);
    public List<Map<String, Object>> getAllConversationsByUser(Integer userId);
    public int addConversationToUser(Integer userId1,Integer userId2);
    public void removeConversation(Integer conversationId);
    public void updateConvoStatus(Integer conversationId, String convoStatus);
    public Message getLastMessageByConversationId(int conversationId);

}
