package com.daniilkalts.lab9.task1;

import java.io.Serializable;
import java.util.Date;

public class MessageData implements Serializable {
  private static final long serialVersionUID = 1L;

  private String userName;
  private String messageText;
  private Date sentDate;

  public MessageData() {}

  public MessageData(String userName, String messageText, Date sentDate) {
    this.userName = userName;
    this.messageText = messageText;
    this.sentDate = sentDate;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getMessageText() {
    return messageText;
  }

  public void setMessageText(String messageText) {
    this.messageText = messageText;
  }

  public Date getSentDate() {
    return sentDate;
  }

  public void setSentDate(Date sentDate) {
    this.sentDate = sentDate;
  }
}
