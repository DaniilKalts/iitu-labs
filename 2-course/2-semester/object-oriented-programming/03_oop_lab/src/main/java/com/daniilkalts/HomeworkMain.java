import java.util.Scanner;

class Student {
  int id;
  String name;
  String surname;
  double gpa;

  Student() {}

  Student(int id, String name, String surname, double gpa) {
    this.id = id;
    this.name = name;
    this.surname = surname;
    this.gpa = gpa;
  }

  String getData() {
    return "ID: " + id + ", Student: " + name + " " + surname + ", GPA: " + gpa;
  }
}

class CPU {
  String name;
  int RAM;
  double frequency;

  CPU() {}

  CPU(String name, int RAM, double frequency) {
    this.name = name;
    this.RAM = RAM;
    this.frequency = frequency;
  }

  String getCPUData() {
    return "CPU: " + name + ", RAM: " + RAM + " MB, Frequency: " + frequency + " GHZ";
  }
}

class Laptop {
  String name;
  int HDDMemory;
  CPU processor;

  Laptop() {}

  Laptop(String name, int HDDMemory, CPU processor) {
    this.name = name;
    this.HDDMemory = HDDMemory;
    this.processor = processor;
  }

  void printLaptopData() {
    System.out.println("Laptop: " + name + ", HDD: " + HDDMemory + " GB");
    System.out.println(processor.getCPUData());
  }

  void execute() {
    if (processor.RAM > 4096 && processor.frequency > 2.5) {
      System.out.println("Laptop is started and executing");
    } else {
      System.out.println("Cannot start computer");
    }
  }
}

class LaptopPrice {
  String name;
  int price;
  int generationOfCPU;
  String ssd;

  LaptopPrice() {}

  LaptopPrice(String name, int price, int generationOfCPU, String ssd) {
    this.name = name;
    this.price = price;
    this.generationOfCPU = generationOfCPU;
    this.ssd = ssd;
  }

  int calcNewPrice() {
    double multiplier = 1.0;
    if (generationOfCPU == 8) {
      multiplier += 0.10;
    } else if (generationOfCPU == 9) {
      multiplier += 0.15;
    } else if (generationOfCPU == 10) {
      multiplier += 0.20;
    }

    if (ssd.equalsIgnoreCase("YES")) {
      multiplier += 0.15;
    }

    return (int) Math.round(price * multiplier);
  }
}

class Tourist {
  String name;
  int money;
  String access;

  Tourist() {}

  Tourist(String name, int money, String access) {
    this.name = name;
    this.money = money;
    this.access = access;
  }
}

class Group {
  String name;
  int countOfTourist;
  Tourist[] tourists;

  Group() {}

  Group(String name, int countOfTourist, Tourist[] tourists) {
    this.name = name;
    this.countOfTourist = countOfTourist;
    this.tourists = tourists;
  }

  boolean canGo() {
    int total = 0;
    for (int i = 0; i < tourists.length; i++) {
      if (tourists[i].access.equalsIgnoreCase("YES")) {
        total += tourists[i].money;
      }
    }
    return total >= 20000;
  }
}

class Oscar {
  String name;
  String surname;
  int movies;
  double rating;

  Oscar() {}

  Oscar(String name, String surname, int movies, double rating) {
    this.name = name;
    this.surname = surname;
    this.movies = movies;
    this.rating = rating;
  }
}

class Drug {
  String name;
  int price;
  String outOfDate;

  Drug() {}

  Drug(String name, int price, String outOfDate) {
    this.name = name;
    this.price = price;
    this.outOfDate = outOfDate;
  }
}

class Pharmacy {
  String name;
  int countOfDrugs;
  Drug[] drugs;

  Pharmacy() {}

  Pharmacy(String name, int countOfDrugs, Drug[] drugs) {
    this.name = name;
    this.countOfDrugs = countOfDrugs;
    this.drugs = drugs;
  }

  Drug mostExpensive() {
    Drug best = drugs[0];
    for (int i = 1; i < drugs.length; i++) {
      if (drugs[i].price > best.price) {
        best = drugs[i];
      }
    }
    return best;
  }
}

class City {
  String name;
  int countOfPharmacy;
  Pharmacy[] pharmacy;

  City() {}

  City(String name, int countOfPharmacy, Pharmacy[] pharmacy) {
    this.name = name;
    this.countOfPharmacy = countOfPharmacy;
    this.pharmacy = pharmacy;
  }

  Drug mostExpensiveInCity() {
    Drug best = pharmacy[0].mostExpensive();
    for (int i = 1; i < pharmacy.length; i++) {
      Drug current = pharmacy[i].mostExpensive();
      if (current.price > best.price) {
        best = current;
      }
    }
    return best;
  }
}

public class HomeworkMain {
  public static void homework_first_task() {
    Student[] students = new Student[] {
      new Student(1, "Ilyas", "Zhuanyshev", 4.0),
      new Student(2, "Aruzhan", "Sadykova", 3.6),
      new Student(3, "Dias", "Kenzhebayev", 3.2),
      new Student(4, "Amir", "Nurgali", 3.8),
      new Student(5, "Alina", "Kassym", 3.4)
    };

    for (int i = 0; i < students.length; i++) {
      System.out.println(students[i].getData());
    }
  }

  public static void homework_second_task() {
    Student[] students = new Student[] {
      new Student(1, "Ilyas", "Zhuanyshev", 4.0),
      new Student(2, "Aruzhan", "Sadykova", 3.6),
      new Student(3, "Dias", "Kenzhebayev", 3.2),
      new Student(4, "Amir", "Nurgali", 3.8),
      new Student(5, "Alina", "Kassym", 3.4),
      new Student(6, "Aigerim", "Ospanova", 3.9),
      new Student(7, "Nursultan", "Amanov", 2.9),
      new Student(8, "Madina", "Serik", 3.7),
      new Student(9, "Timur", "Baimukan", 3.1),
      new Student(10, "Aruzhan", "Mukasheva", 3.5)
    };

    for (int i = 0; i < students.length - 1; i++) {
      for (int j = 0; j < students.length - 1 - i; j++) {
        if (students[j].gpa < students[j + 1].gpa) {
          Student tmp = students[j];
          students[j] = students[j + 1];
          students[j + 1] = tmp;
        }
      }
    }

    for (int i = 0; i < students.length; i++) {
      System.out.println(students[i].getData());
    }
  }

  public static void homework_third_task() {
    CPU cpu = new CPU("Intel", 8192, 2.7);
    Laptop laptop = new Laptop("Dell", 512, cpu);
    laptop.printLaptopData();
    laptop.execute();
  }

  public static void homework_fourth_task() {
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    LaptopPrice[] laptops = new LaptopPrice[n];

    for (int i = 0; i < n; i++) {
      String name = sc.next();
      int price = sc.nextInt();
      int gen = sc.nextInt();
      String ssd = sc.next();
      laptops[i] = new LaptopPrice(name, price, gen, ssd);
    }

    for (int i = 0; i < n; i++) {
      System.out.println(laptops[i].name + " " + laptops[i].calcNewPrice());
    }
  }

  public static void homework_forth_task() {
    homework_fourth_task();
  }

  public static void homework_fifth_task() {
    Scanner sc = new Scanner(System.in);
    int groupCount = sc.nextInt();

    for (int g = 0; g < groupCount; g++) {
      String groupName = sc.next();
      int count = sc.nextInt();
      Tourist[] tourists = new Tourist[count];

      for (int i = 0; i < count; i++) {
        String name = sc.next();
        int money = sc.nextInt();
        String access = sc.next();
        tourists[i] = new Tourist(name, money, access);
      }

      Group group = new Group(groupName, count, tourists);
      System.out.println(group.name + " - " + (group.canGo() ? "YES" : "NO"));
    }
  }

  public static void homework_sixth_task() {
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    Oscar[] list = new Oscar[n];

    for (int i = 0; i < n; i++) {
      String name = sc.next();
      String surname = sc.next();
      int movies = sc.nextInt();
      double rating = sc.nextDouble();
      list[i] = new Oscar(name, surname, movies, rating);
    }

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - 1 - i; j++) {
        if (list[j].rating < list[j + 1].rating) {
          Oscar tmp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = tmp;
        } else if (list[j].rating == list[j + 1].rating && list[j].movies < list[j + 1].movies) {
          Oscar tmp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = tmp;
        }
      }
    }

    for (int i = 0; i < n; i++) {
      System.out.println(list[i].name + " " + list[i].surname + " " + list[i].movies + " " + list[i].rating);
    }
  }

  public static void homework_seventh_task() {
    Scanner sc = new Scanner(System.in);
    int cityCount = sc.nextInt();

    for (int c = 0; c < cityCount; c++) {
      String cityName = sc.next();
      int pharmacyCount = sc.nextInt();
      Pharmacy[] pharmacies = new Pharmacy[pharmacyCount];

      for (int p = 0; p < pharmacyCount; p++) {
        String pharmacyName = sc.next();
        int drugCount = sc.nextInt();
        Drug[] drugs = new Drug[drugCount];

        for (int d = 0; d < drugCount; d++) {
          String drugName = sc.next();
          int price = sc.nextInt();
          String outOfDate = sc.next();
          drugs[d] = new Drug(drugName, price, outOfDate);
        }

        pharmacies[p] = new Pharmacy(pharmacyName, drugCount, drugs);
      }

      City city = new City(cityName, pharmacyCount, pharmacies);
      System.out.println("City: " + city.name);

      for (int p = 0; p < pharmacies.length; p++) {
        Drug best = pharmacies[p].mostExpensive();
        System.out.println("The most expensive drug in " + pharmacies[p].name + " is " + best.name);
      }

      Drug bestCity = city.mostExpensiveInCity();
      System.out.println("THE MOST EXPENSIVE DRUG IN " + city.name + ": " + bestCity.name);
    }
  }

  public static void main(String[] args) {
    homework_first_task();
    // homework_second_task();
    // homework_third_task();
    // homework_fourth_task();
    // homework_fifth_task();
    // homework_sixth_task();
    // homework_seventh_task();
  }
}
