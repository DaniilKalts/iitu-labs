import java.util.Scanner;

class User {
  protected int id;
  protected String login;
  protected String password;
  protected String name;
  protected String surname;

  User() {}

  User(int id, String login, String password, String name, String surname) {
    this.id = id;
    this.login = login;
    this.password = password;
    this.name = name;
    this.surname = surname;
  }

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getLogin() {
    return login;
  }

  void setLogin(String login) {
    this.login = login;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getSurname() {
    return surname;
  }

  void setSurname(String surname) {
    this.surname = surname;
  }

  String getData() {
    return "USER -> ID: " + id + ", Login: " + login + ", Password: " + password + ", Name: " + name + " " + surname;
  }
}

class Staff extends User {
  private double salary;
  private String[] subjects = new String[100];
  private int indexOfSubject = 0;

  Staff() {}

  Staff(int id, String login, String password, String name, String surname, double salary) {
    super(id, login, password, name, surname);
    this.salary = salary;
  }

  double getSalary() {
    return salary;
  }

  void setSalary(double salary) {
    this.salary = salary;
  }

  void addSubject(String subject) {
    if (indexOfSubject < subjects.length) {
      subjects[indexOfSubject] = subject;
      indexOfSubject++;
    }
  }

  String getSubjectsData() {
    if (indexOfSubject == 0) {
      return "No subjects";
    }

    String result = "";
    for (int i = 0; i < indexOfSubject; i++) {
      result += subjects[i];
      if (i != indexOfSubject - 1) {
        result += ", ";
      }
    }
    return result;
  }

  @Override
  String getData() {
    return "STAFF -> ID: " + id + ", Login: " + login + ", Password: " + password + ", Name: " + name + " " + surname
        + ", Salary: " + salary + ", Subjects: " + getSubjectsData();
  }
}

class Student extends User {
  private double gpa;
  private String[] courses = new String[100];
  private int indexOfCourses = 0;

  Student() {}

  Student(int id, String login, String password, String name, String surname, double gpa) {
    super(id, login, password, name, surname);
    this.gpa = gpa;
  }

  double getGpa() {
    return gpa;
  }

  void setGpa(double gpa) {
    this.gpa = gpa;
  }

  void addCourse(String course) {
    if (indexOfCourses < courses.length) {
      courses[indexOfCourses] = course;
      indexOfCourses++;
    }
  }

  String getCoursesData() {
    if (indexOfCourses == 0) {
      return "No courses";
    }

    String result = "";
    for (int i = 0; i < indexOfCourses; i++) {
      result += courses[i];
      if (i != indexOfCourses - 1) {
        result += ", ";
      }
    }
    return result;
  }

  @Override
  String getData() {
    return "STUDENT -> ID: " + id + ", Login: " + login + ", Password: " + password + ", Name: " + name + " " + surname
        + ", GPA: " + gpa + ", Courses: " + getCoursesData();
  }
}

public class ClassworkMain {
  static User[] users = new User[100];
  static int sizeOfUsers = 0;

  static void addUser(User user) {
    if (sizeOfUsers < users.length) {
      users[sizeOfUsers] = user;
      sizeOfUsers++;
    }
  }

  static void printUsers() {
    for (int i = 0; i < sizeOfUsers; i++) {
      System.out.println(users[i].getData());
    }
  }

  static void printStudents() {
    for (int i = 0; i < sizeOfUsers; i++) {
      if (users[i] instanceof Student) {
        System.out.println(users[i].getData());
      }
    }
  }

  static void printStaff() {
    for (int i = 0; i < sizeOfUsers; i++) {
      if (users[i] instanceof Staff) {
        System.out.println(users[i].getData());
      }
    }
  }

  public static void classwork_first_task() {
    User[] allUsers = new User[15];
    int cursor = 0;

    User u1 = new User(1, "user1", "pass1", "Daniil", "Kalts");
    User u2 = new User(2, "user2", "pass2", "Aruzhan", "Sadykova");
    User u3 = new User(3, "user3", "pass3", "Dias", "Nurgali");
    User u4 = new User(4, "user4", "pass4", "Timur", "Amanov");
    User u5 = new User(5, "user5", "pass5", "Alina", "Serik");

    allUsers[cursor++] = u1;
    allUsers[cursor++] = u2;
    allUsers[cursor++] = u3;
    allUsers[cursor++] = u4;
    allUsers[cursor++] = u5;

    Student s1 = new Student(6, "st1", "111", "Ilyas", "Zhuanyshev", 3.8);
    s1.addCourse("OOP");
    s1.addCourse("Math");
    Student s2 = new Student(7, "st2", "222", "Aigerim", "Mukhanova", 3.4);
    s2.addCourse("Physics");
    s2.addCourse("English");
    Student s3 = new Student(8, "st3", "333", "Nursultan", "Amanov", 3.2);
    s3.addCourse("Algorithms");
    Student s4 = new Student(9, "st4", "444", "Madina", "Kairat", 3.9);
    s4.addCourse("Databases");
    s4.addCourse("Networks");
    Student s5 = new Student(10, "st5", "555", "Aruzhan", "Kassym", 3.6);
    s5.addCourse("AI");

    allUsers[cursor++] = s1;
    allUsers[cursor++] = s2;
    allUsers[cursor++] = s3;
    allUsers[cursor++] = s4;
    allUsers[cursor++] = s5;

    Staff t1 = new Staff(11, "sf1", "qwe", "Azamat", "Nurpeisov", 350000);
    t1.addSubject("Java");
    t1.addSubject("OOP");
    Staff t2 = new Staff(12, "sf2", "asd", "Marat", "Kenzhebek", 300000);
    t2.addSubject("Math");
    Staff t3 = new Staff(13, "sf3", "zxc", "Aiman", "Tulegen", 280000);
    t3.addSubject("Physics");
    Staff t4 = new Staff(14, "sf4", "rty", "Anel", "Sabitova", 330000);
    t4.addSubject("English");
    t4.addSubject("Communication");
    Staff t5 = new Staff(15, "sf5", "fgh", "Maksat", "Orynbek", 370000);
    t5.addSubject("Data Structures");

    allUsers[cursor++] = t1;
    allUsers[cursor++] = t2;
    allUsers[cursor++] = t3;
    allUsers[cursor++] = t4;
    allUsers[cursor++] = t5;

    for (int i = 0; i < cursor; i++) {
      System.out.println(allUsers[i].getData());
    }
  }

  static User readBaseUserData(Scanner scanner) {
    System.out.print("INSERT ID: ");
    int id = scanner.nextInt();
    scanner.nextLine();

    System.out.print("INSERT LOGIN: ");
    String login = scanner.nextLine();
    System.out.print("INSERT PASSWORD: ");
    String password = scanner.nextLine();
    System.out.print("INSERT NAME: ");
    String name = scanner.nextLine();
    System.out.print("INSERT SURNAME: ");
    String surname = scanner.nextLine();

    return new User(id, login, password, name, surname);
  }

  public static void classwork_second_task() {
    Scanner scanner = new Scanner(System.in);

    while (true) {
      System.out.println("PRESS [1] ADD USER");
      System.out.println("PRESS [2] TO LIST USERS");
      System.out.println("PRESS [0] TO EXIT");

      int command = scanner.nextInt();
      scanner.nextLine();

      if (command == 1) {
        System.out.println("PRESS [1] TO ADD STUDENT");
        System.out.println("PRESS [2] TO ADD STAFF");
        int addType = scanner.nextInt();
        scanner.nextLine();

        User base = readBaseUserData(scanner);
        if (addType == 1) {
          System.out.print("INSERT GPA: ");
          double gpa = scanner.nextDouble();
          scanner.nextLine();

          Student student = new Student(base.getId(), base.getLogin(), base.getPassword(), base.getName(), base.getSurname(), gpa);

          System.out.print("HOW MANY COURSES TO ADD: ");
          int courseCount = scanner.nextInt();
          scanner.nextLine();
          for (int i = 0; i < courseCount; i++) {
            System.out.print("INSERT COURSE: ");
            student.addCourse(scanner.nextLine());
          }
          addUser(student);
        } else if (addType == 2) {
          System.out.print("INSERT SALARY: ");
          double salary = scanner.nextDouble();
          scanner.nextLine();

          Staff staff = new Staff(base.getId(), base.getLogin(), base.getPassword(), base.getName(), base.getSurname(), salary);

          System.out.print("HOW MANY SUBJECTS TO ADD: ");
          int subjectCount = scanner.nextInt();
          scanner.nextLine();
          for (int i = 0; i < subjectCount; i++) {
            System.out.print("INSERT SUBJECT: ");
            staff.addSubject(scanner.nextLine());
          }
          addUser(staff);
        }
      } else if (command == 2) {
        System.out.println("PRESS [1] TO LIST STUDENTS");
        System.out.println("PRESS [2] TO LIST STAFF");
        System.out.println("PRESS [3] TO LIST ALL USERS");

        int listType = scanner.nextInt();
        scanner.nextLine();

        if (listType == 1) {
          printStudents();
        } else if (listType == 2) {
          printStaff();
        } else if (listType == 3) {
          printUsers();
        }
      } else if (command == 0) {
        break;
      }
    }
  }

  public static void main(String[] args) {
    classwork_first_task();
    // classwork_second_task();
  }
}
