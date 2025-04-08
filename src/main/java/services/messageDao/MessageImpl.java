package services.messageDao;

import java.util.List;

import model.Message;

public class MessageImpl implements MessageInter{
    @Override
    public void addMessage(Message msg) {
        MessageDao.createMessage(msg);
    }

    @Override
    public void deleteMessage(int messageId) {
       MessageDao.deleteMessage(messageId);
    }

    @Override
    public void updateMessage(int messageId, String newContent) {
        MessageDao.updateMessage(messageId, newContent);
    }

    @Override
    public List<Message> getMessagesByConversationId(int conversationId) {
        List<Message> messages = MessageDao.getMessagesByConversationId(conversationId);
        return messages;}

    @Override
    public Message getMessageById(int messageId) {
        Message message = MessageDao.getMessageById(messageId);
        return message;}

    @Override
    public Message getLastMessageByConversationId(int conversationId) {
        Message message = MessageDao.getLastMessageByConversationId(conversationId);
        return message;}

    @Override
    public void markMessageAsRead(int messageId) {
        MessageDao.markMessageAsRead(messageId);}

    @Override
    public List<Message> getUnreadMessagesByConversationId(int conversationId,int userId) {
        List<Message> messages = MessageDao.getUnreadMessagesByConversationId(conversationId,userId);
        return messages;}
    @Override
    public void deleteMessagesByConversationId(int conversationId) {
        MessageDao.deleteMessagesByConversationId(conversationId);}

    @Override
    public void MarkAllMessagesAsRead(int conversationId,int UserId) {
        MessageDao.MarkAllMessagesAsRead(conversationId,UserId);
    }
}
