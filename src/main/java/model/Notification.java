package model;

import jakarta.persistence.*;

@Entity
@Table(name="notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String message;
    private Integer userId;
    @Enumerated(EnumType.STRING)
    private NotifStatus status ;
    private int itemId;
    private int possibleId;
    private String dateSent;

    public String getDateSent() {
        return dateSent;
    }

    public void setDateSent(String dateSent) {
        this.dateSent = dateSent;
    }

    public Notification(Integer userIdPossible, String messagePossible, NotifStatus notifStatus, Integer itemId, Integer possibleId) {
        this.userId = userIdPossible;
        this.message = messagePossible;
        this.status = notifStatus;
        this.itemId = itemId;
        this.possibleId = possibleId;

    }

    public int getPossibleId() {
        return possibleId;
    }

    public void setPossibleId(int possibleId) {
        this.possibleId = possibleId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getId() {
        return id;
    }
    public Notification(){}



    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public NotifStatus getStatus() {
        return status;
    }

    public void setStatus(NotifStatus status) {
        this.status = status;
    }
}
