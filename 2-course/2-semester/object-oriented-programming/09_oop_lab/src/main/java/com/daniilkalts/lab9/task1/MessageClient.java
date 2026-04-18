package com.daniilkalts.lab9.task1;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Date;
import java.util.Scanner;

public class MessageClient {
  public static final String HOST = "localhost";
  public static final int PORT = 5000;

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("Insert user name: ");
    String userName = scanner.nextLine();

    while (true) {
      System.out.println("PRESS [1] TO SEND MESSAGE");
      System.out.println("PRESS [2] TO EXIT");
      String choice = scanner.nextLine();

      if ("1".equals(choice)) {
        System.out.print("Insert message text: ");
        String messageText = scanner.nextLine();
        MessageData messageData = new MessageData(userName, messageText, new Date());

        try (
            Socket socket = new Socket(HOST, PORT);
            ObjectOutputStream outputStream = new ObjectOutputStream(socket.getOutputStream())) {
          outputStream.writeObject(messageData);
          outputStream.flush();
        } catch (IOException e) {
          System.out.println("Client error: " + e.getMessage());
        }
      } else if ("2".equals(choice)) {
        break;
      }
    }
  }
}
