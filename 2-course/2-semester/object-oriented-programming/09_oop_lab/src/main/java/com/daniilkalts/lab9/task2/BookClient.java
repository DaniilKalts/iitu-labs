package com.daniilkalts.lab9.task2;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Scanner;

public class BookClient {
  public static final String HOST = "localhost";
  public static final int PORT = 5001;

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    try (
        Socket socket = new Socket(HOST, PORT);
        ObjectOutputStream outputStream = new ObjectOutputStream(socket.getOutputStream());
        ObjectInputStream inputStream = new ObjectInputStream(socket.getInputStream())) {

      while (true) {
        System.out.println("PRESS 1 TO LIST BOOKS");
        System.out.println("PRESS 2 TO ADD BOOKS");
        System.out.println("PRESS 0 TO DISCONNECT FROM SERVER");
        String choice = scanner.nextLine();

        if ("1".equals(choice)) {
          PackageData request = new PackageData();
          request.setOperationType("LIST_BOOKS");
          outputStream.writeObject(request);
          outputStream.flush();

          PackageData response = (PackageData) inputStream.readObject();
          ArrayList<Book> books = response.getBooks();
          if (books == null || books.isEmpty()) {
            System.out.println("No books");
          } else {
            for (int i = 0; i < books.size(); i++) {
              System.out.println(books.get(i));
            }
          }
        } else if ("2".equals(choice)) {
          System.out.print("Insert id: ");
          int id = Integer.parseInt(scanner.nextLine());
          System.out.print("Insert name: ");
          String name = scanner.nextLine();
          System.out.print("Insert author: ");
          String author = scanner.nextLine();

          PackageData request = new PackageData();
          request.setOperationType("ADD_BOOK");
          request.setBook(new Book(id, name, author));
          outputStream.writeObject(request);
          outputStream.flush();

          inputStream.readObject();
          System.out.println("Book added");
        } else if ("0".equals(choice)) {
          PackageData request = new PackageData();
          request.setOperationType("DISCONNECT");
          outputStream.writeObject(request);
          outputStream.flush();
          break;
        }
      }
    } catch (IOException | ClassNotFoundException e) {
      System.out.println("Client error: " + e.getMessage());
    }
  }
}
