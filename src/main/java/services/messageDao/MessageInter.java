package services.messageDao;
import model.Message;
import java.util.List;
public interface MessageInter {
    public void addMessage(Message msg);
    public void deleteMessage(int messageId);
    public void updateMessage(int messageId, String newContent);
    public List<Message> getMessagesByConversationId(int conversationId);
    public Message getMessageById(int messageId);
    public Message getLastMessageByConversationId(int conversationId);
    public void markMessageAsRead(int messageId);
    public List<Message> getUnreadMessagesByConversationId(int conversationId,int UserId);
    public void deleteMessagesByConversationId(int conversationId);
    public  void MarkAllMessagesAsRead(int conversationId,int userId);
}
