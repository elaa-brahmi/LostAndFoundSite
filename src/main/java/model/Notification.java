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

    public Notification(Integer userIdPossible, String messagePossible, NotifStatus notifStatus) {
        this.userId = userIdPossible;
        this.message = messagePossible;
        this.status = notifStatus;

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
