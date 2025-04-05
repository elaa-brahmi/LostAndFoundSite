package model;

import java.util.List;

public class Conversation {
    private int id;
    private Integer user1_id;
    private Integer user2_id;
    private String Created_At;
    private List<Message> messages;

    public Conversation(int i, int i1) {
        user1_id = i;
        user2_id = i1;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public Conversation(Integer user1_id, Integer user2_id, String created_At, List<Message> messages) {
        this.user1_id = user1_id;
        this.user2_id = user2_id;
        Created_At = created_At;
        this.messages = messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public Conversation(Integer user1_id, String created_At, Integer user2_id) {
        this.user1_id = user1_id;
        Created_At = created_At;
        this.user2_id = user2_id;
    }
public Conversation(){};

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getUser1_id() {
        return user1_id;
    }

    public void setUser1_id(Integer user1_id) {
        this.user1_id = user1_id;
    }

    public Integer getUser2_id() {
        return user2_id;
    }

    public void setUser2_id(Integer user2_id) {
        this.user2_id = user2_id;
    }

    public String getCreated_At() {
        return Created_At;
    }

    public void setCreated_At(String created_At) {
        Created_At = created_At;
    }
}
