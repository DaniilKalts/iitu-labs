package com.daniilkalts.lab9.task2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class BookServer {
  public static final int PORT = 5001;
  private static final String STORAGE_PATH = "09_oop_lab/data/books.ser";
  private static final Object LOCK = new Object();

  public static void main(String[] args) {
    initializeStorage();

    try (ServerSocket serverSocket = new ServerSocket(PORT)) {
      System.out.println("Book server started on port " + PORT);

      while (true) {
        Socket socket = serverSocket.accept();
        new ClientHandler(socket).start();
      }
    } catch (IOException e) {
      System.out.println("Server error: " + e.getMessage());
    }
  }

  private static void initializeStorage() {
    File file = new File(STORAGE_PATH);
    File parent = file.getParentFile();

    if (parent != null && !parent.exists()) {
      parent.mkdirs();
    }

    if (!file.exists()) {
      ArrayList<Book> books = new ArrayList<>();
      books.add(new Book(1, "The Hobbit", "J.R.R. Tolkien"));
      books.add(new Book(2, "1984", "George Orwell"));
      books.add(new Book(3, "Clean Code", "Robert C. Martin"));
      saveBooks(books);
    }
  }

  private static ArrayList<Book> loadBooks() {
    synchronized (LOCK) {
      try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(STORAGE_PATH))) {
        return (ArrayList<Book>) inputStream.readObject();
      } catch (IOException | ClassNotFoundException e) {
        return new ArrayList<>();
      }
    }
  }

  private static void saveBooks(ArrayList<Book> books) {
    synchronized (LOCK) {
      try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(STORAGE_PATH))) {
        outputStream.writeObject(books);
        outputStream.flush();
      } catch (IOException e) {
        System.out.println("Storage error: " + e.getMessage());
      }
    }
  }

  private static class ClientHandler extends Thread {
    private final Socket socket;

    ClientHandler(Socket socket) {
      this.socket = socket;
    }

    @Override
    public void run() {
      try (
          Socket clientSocket = socket;
          ObjectOutputStream outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
          ObjectInputStream inputStream = new ObjectInputStream(clientSocket.getInputStream())) {

        while (true) {
          PackageData request = (PackageData) inputStream.readObject();
          if (request == null || request.getOperationType() == null) {
            break;
          }

          if ("LIST_BOOKS".equals(request.getOperationType())) {
            PackageData response = new PackageData();
            response.setOperationType("LIST_BOOKS");
            response.setBooks(loadBooks());
            outputStream.writeObject(response);
            outputStream.flush();
          } else if ("ADD_BOOK".equals(request.getOperationType())) {
            ArrayList<Book> books = loadBooks();
            books.add(request.getBook());
            saveBooks(books);

            PackageData response = new PackageData();
            response.setOperationType("ADD_BOOK");
            response.setBooks(books);
            outputStream.writeObject(response);
            outputStream.flush();
          } else if ("DISCONNECT".equals(request.getOperationType())) {
            break;
          }
        }
      } catch (IOException | ClassNotFoundException e) {
        System.out.println("Client disconnected");
      }
    }
  }
}
