package com.daniilkalts.lab9.task1;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;

public class MessageServer {
  public static final int PORT = 5000;

  public static void main(String[] args) {
    SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");

    try (ServerSocket serverSocket = new ServerSocket(PORT)) {
      System.out.println("Message server started on port " + PORT);

      while (true) {
        try (
            Socket socket = serverSocket.accept();
            ObjectInputStream inputStream = new ObjectInputStream(socket.getInputStream())) {
          MessageData message = (MessageData) inputStream.readObject();
          System.out.println("\"" + message.getMessageText() + "\" from " + message.getUserName()
              + " at " + formatter.format(message.getSentDate()));
        } catch (ClassNotFoundException e) {
          System.out.println("Invalid data received");
        }
      }
    } catch (IOException e) {
      System.out.println("Server error: " + e.getMessage());
    }
  }
}
