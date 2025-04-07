package model;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

public class FriendRequest {
    Integer id;
    Integer SenderId;
    Integer receiverId;
    @Enumerated(EnumType.STRING)
    FriendRequestEnum status;
    String created_at;
public FriendRequest() {}

    public FriendRequest(Integer senderId, Integer receiverId) {
        this.SenderId = senderId;
        this.receiverId = receiverId;
    }

    @Override
    public String toString() {
        return "FriendRequest{" +
                "id=" + id +
                ", SenderId=" + SenderId +
                ", receiverId=" + receiverId +
                ", status=" + status +
                ", created_at='" + created_at + '\'' +
                '}';
    }

    public FriendRequest(Integer senderId, Integer receiverId, FriendRequestEnum status, String created_at) {
        SenderId = senderId;
        this.receiverId = receiverId;
        this.status = status;
        this.created_at = created_at;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public FriendRequest(Integer userId, Integer receiverId, FriendRequestEnum status) {
        this.SenderId = userId;
        this.receiverId = receiverId;
        this.status = status;
    }

    public Integer getSenderId() {
        return SenderId;
    }

    public void setSenderId(Integer userId) {
        this.SenderId = userId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public FriendRequestEnum getStatus() {
        return status;
    }

    public void setStatus(FriendRequestEnum status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
