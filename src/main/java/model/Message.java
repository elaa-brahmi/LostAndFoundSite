package model;

import java.util.Objects;

public class Message {
private Integer id;
private Integer conversationId;
private Integer senderId;
private String content;
private String sendAt;
private boolean isRead ;

    public Message(Integer conversationId, String contact, Integer senderId, String sendAt, boolean isRead) {
        this.conversationId = conversationId;
        this.content = contact;
        this.senderId = senderId;
        this.sendAt = sendAt;
        this.isRead = isRead;
    }

    public Message(String content, int i, int i1) {
        this.content = content;
        this.senderId = i;
        this.conversationId = i1;

    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Message message = (Message) o;
        return isRead == message.isRead && Objects.equals(id, message.id) && Objects.equals(conversationId, message.conversationId) && Objects.equals(senderId, message.senderId) && Objects.equals(content, message.content) && Objects.equals(sendAt, message.sendAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, conversationId, senderId, content, sendAt, isRead);
    }

    public Message() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConversationId() {
        return conversationId;
    }

    public void setConversationId(Integer conversationId) {
        this.conversationId = conversationId;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public String getContact() {
        return content;
    }

    public void setContact(String contact) {
        this.content = contact;
    }

    public String getSendAt() {
        return sendAt;
    }

    public void setSendAt(String sendAt) {
        this.sendAt = sendAt;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }
}
