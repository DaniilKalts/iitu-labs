import java.util.Scanner;

class Book {
  protected String name;
  protected String code;
  protected int pages;

  Book() {}

  Book(String name, String code, int pages) {
    this.name = name;
    this.code = code;
    this.pages = pages;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getCode() {
    return code;
  }

  void setCode(String code) {
    this.code = code;
  }

  int getPages() {
    return pages;
  }

  void setPages(int pages) {
    this.pages = pages;
  }

  String getBookData() {
    return "BOOK -> Name: " + name + ", Code: " + code + ", Pages: " + pages;
  }
}

class ScientificBook extends Book {
  private int price;
  private String publisher;

  ScientificBook() {}

  ScientificBook(String name, String code, int pages, int price, String publisher) {
    super(name, code, pages);
    this.price = price;
    this.publisher = publisher;
  }

  int getPrice() {
    return price;
  }

  void setPrice(int price) {
    this.price = price;
  }

  String getPublisher() {
    return publisher;
  }

  void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  @Override
  String getBookData() {
    return "SCIENTIFIC BOOK -> Name: " + name + ", Code: " + code + ", Pages: " + pages + ", Price: " + price
        + ", Publisher: " + publisher;
  }
}

class LiteratureBook extends Book {
  private String author;
  private int publishedYear;

  LiteratureBook() {}

  LiteratureBook(String name, String code, int pages, String author, int publishedYear) {
    super(name, code, pages);
    this.author = author;
    this.publishedYear = publishedYear;
  }

  String getAuthor() {
    return author;
  }

  void setAuthor(String author) {
    this.author = author;
  }

  int getPublishedYear() {
    return publishedYear;
  }

  void setPublishedYear(int publishedYear) {
    this.publishedYear = publishedYear;
  }

  @Override
  String getBookData() {
    return "LITERATURE BOOK -> Name: " + name + ", Code: " + code + ", Pages: " + pages + ", Author: " + author
        + ", Published year: " + publishedYear;
  }
}

class Library {
  private String name;
  private String city;
  private String country;
  private Book[] books = new Book[100];
  private int sizeOfBooks = 0;

  Library() {}

  Library(String name, String city, String country) {
    this.name = name;
    this.city = city;
    this.country = country;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getCity() {
    return city;
  }

  void setCity(String city) {
    this.city = city;
  }

  String getCountry() {
    return country;
  }

  void setCountry(String country) {
    this.country = country;
  }

  void addBook(Book b) {
    if (sizeOfBooks < books.length) {
      books[sizeOfBooks] = b;
      sizeOfBooks++;
    }
  }

  void printLibraryData() {
    System.out.println("Library: " + name + ", " + city + ", " + country);
    for (int i = 0; i < sizeOfBooks; i++) {
      System.out.println(books[i].getBookData());
    }
  }

  void searchByName(String targetName) {
    boolean found = false;
    for (int i = 0; i < sizeOfBooks; i++) {
      if (books[i].getName().equalsIgnoreCase(targetName)) {
        System.out.println(books[i].getBookData());
        found = true;
      }
    }
    if (!found) {
      System.out.println("No books found by this name.");
    }
  }

  void searchByCode(String targetCode) {
    boolean found = false;
    for (int i = 0; i < sizeOfBooks; i++) {
      if (books[i].getCode().equalsIgnoreCase(targetCode)) {
        System.out.println(books[i].getBookData());
        found = true;
      }
    }
    if (!found) {
      System.out.println("No books found by this code.");
    }
  }

  void searchByPagesAmount(int minPages, int maxPages) {
    boolean found = false;
    for (int i = 0; i < sizeOfBooks; i++) {
      int currentPages = books[i].getPages();
      if (currentPages >= minPages && currentPages <= maxPages) {
        System.out.println(books[i].getBookData());
        found = true;
      }
    }
    if (!found) {
      System.out.println("No books found in this page range.");
    }
  }
}

public class HomeworkMain {
  static void fillLibraryWithDemoBooks(Library library) {
    library.addBook(new ScientificBook("Clean Code", "SCI-001", 464, 12000, "Prentice Hall"));
    library.addBook(new ScientificBook("Introduction to Algorithms", "SCI-002", 1312, 25000, "MIT Press"));
    library.addBook(new ScientificBook("Design Patterns", "SCI-003", 395, 17000, "Addison-Wesley"));
    library.addBook(new ScientificBook("Artificial Intelligence", "SCI-004", 1152, 21000, "Pearson"));
    library.addBook(new ScientificBook("Database System Concepts", "SCI-005", 1376, 23000, "McGraw-Hill"));

    library.addBook(new LiteratureBook("Abai Zholy", "LIT-001", 560, "Mukhtar Auezov", 1942));
    library.addBook(new LiteratureBook("The Hobbit", "LIT-002", 310, "J. R. R. Tolkien", 1937));
    library.addBook(new LiteratureBook("1984", "LIT-003", 328, "George Orwell", 1949));
    library.addBook(new LiteratureBook("The Little Prince", "LIT-004", 96, "Antoine de Saint-Exupery", 1943));
    library.addBook(new LiteratureBook("Crime and Punishment", "LIT-005", 671, "Fyodor Dostoevsky", 1866));

    Book myBook = new Book("книга", "2404", 100);
    library.addBook(myBook);
  }

  public static void homework_first_task() {
    Library library = new Library("National Library", "Astana", "Kazakhstan");
    fillLibraryWithDemoBooks(library);
    library.printLibraryData();

  }

  public static void homework_second_task() {
    Library library = new Library("National Library", "Astana", "Kazakhstan");
    fillLibraryWithDemoBooks(library);

    Scanner scanner = new Scanner(System.in);

    while (true) {
      System.out.println("PRESS [1] TO SEARCH BOOK BY NAME");
      System.out.println("PRESS [2] TO SEARCH BOOK BY CODE");
      System.out.println("PRESS [3] TO SEARCH BOOK BY PAGES AMOUNT");
      System.out.println("PRESS [0] TO EXIT");

      int command = scanner.nextInt();
      scanner.nextLine();

      if (command == 1) {
        System.out.println("INSERT NAME OF THE BOOK:");
        String bookName = scanner.nextLine();
        library.searchByName(bookName);
      } else if (command == 2) {
        System.out.println("INSERT CODE OF THE BOOK:");
        String bookCode = scanner.nextLine();
        library.searchByCode(bookCode);
      } else if (command == 3) {
        System.out.println("INSERT MINIMUM AMOUNT OF PAGES:");
        int minPages = scanner.nextInt();
        System.out.println("INSERT MAXIMUM AMOUNT OF PAGES:");
        int maxPages = scanner.nextInt();
        scanner.nextLine();
        library.searchByPagesAmount(minPages, maxPages);
      } else if (command == 0) {
        break;
      }
    }
  }

  public static void main(String[] args) {
    homework_first_task();
    // homework_second_task();
  }
}
