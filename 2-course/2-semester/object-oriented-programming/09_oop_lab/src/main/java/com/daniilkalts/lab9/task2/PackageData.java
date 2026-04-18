package com.daniilkalts.lab9.task2;

import java.io.Serializable;
import java.util.ArrayList;

public class PackageData implements Serializable {
  private static final long serialVersionUID = 1L;

  private String operationType;
  private ArrayList<Book> books;
  private Book book;

  public PackageData() {}

  public String getOperationType() {
    return operationType;
  }

  public void setOperationType(String operationType) {
    this.operationType = operationType;
  }

  public ArrayList<Book> getBooks() {
    return books;
  }

  public void setBooks(ArrayList<Book> books) {
    this.books = books;
  }

  public Book getBook() {
    return book;
  }

  public void setBook(Book book) {
    this.book = book;
  }
}
