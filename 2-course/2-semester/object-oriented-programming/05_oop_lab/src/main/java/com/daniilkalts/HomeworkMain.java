interface Restaurant {
  double getTotalIncome();

  double getTotalOutcome();
}

class City {
  private Restaurant[] allRestaurants = new Restaurant[50];
  private int restaurantSize = 0;
  private String cityName;

  City(String cityName) {
    this.cityName = cityName;
  }

  City() {}

  String getCityName() {
    return cityName;
  }

  void setCityName(String cityName) {
    this.cityName = cityName;
  }

  void addRestaurant(Restaurant restaurant) {
    if (restaurantSize < allRestaurants.length) {
      allRestaurants[restaurantSize] = restaurant;
      restaurantSize++;
    }
  }

  double getTotalTax() {
    double totalProfit = 0;
    for (int i = 0; i < restaurantSize; i++) {
      totalProfit += allRestaurants[i].getTotalIncome() - allRestaurants[i].getTotalOutcome();
    }
    return totalProfit * 0.15;
  }
}

class MCDonalds implements Restaurant {
  private int[] burgersPrices = new int[100];
  private int[] workersSalary = new int[20];
  private int burgersSize = 0;
  private int workersSize = 0;

  void addBurger(int burgerPrice) {
    if (burgersSize < burgersPrices.length) {
      burgersPrices[burgersSize] = burgerPrice;
      burgersSize++;
    }
  }

  void addWorker(int workerSalary) {
    if (workersSize < workersSalary.length) {
      workersSalary[workersSize] = workerSalary;
      workersSize++;
    }
  }

  @Override
  public double getTotalIncome() {
    int totalIncome = 0;
    for (int i = 0; i < burgersSize; i++) {
      totalIncome += burgersPrices[i];
    }
    return totalIncome;
  }

  @Override
  public double getTotalOutcome() {
    int totalOutcome = 0;
    for (int i = 0; i < workersSize; i++) {
      totalOutcome += workersSalary[i];
    }
    return totalOutcome;
  }
}

class KFC implements Restaurant {
  private int[] basketPrices = new int[100];
  private int basketSize = 0;

  void addBasket(int basketPrice) {
    if (basketSize < basketPrices.length) {
      basketPrices[basketSize] = basketPrice;
      basketSize++;
    }
  }

  @Override
  public double getTotalIncome() {
    int totalIncome = 0;
    for (int i = 0; i < basketSize; i++) {
      totalIncome += basketPrices[i];
    }
    return totalIncome;
  }

  @Override
  public double getTotalOutcome() {
    return 0;
  }
}

abstract class Person {
  protected String name;
  protected int age;
  protected int shootingExperience;

  Person() {}

  Person(String name, int age, int shootingExperience) {
    this.name = name;
    this.age = age;
    this.shootingExperience = shootingExperience;
  }

  abstract boolean shoot();

  String getPersonData() {
    return "Type: " + getClass().getSimpleName() + ", Name: " + name + ", Age: " + age
        + ", Shooting Experience: " + shootingExperience;
  }

  protected boolean hitByChance(double chance) {
    if (chance < 0) {
      chance = 0;
    } else if (chance > 1) {
      chance = 1;
    }
    return Math.random() < chance;
  }
}

class Newbie extends Person {
  Newbie() {}

  Newbie(String name, int age, int shootingExperience) {
    super(name, age, shootingExperience);
  }

  @Override
  boolean shoot() {
    return hitByChance(0.01 * shootingExperience);
  }
}

class Experienced extends Person {
  Experienced() {}

  Experienced(String name, int age, int shootingExperience) {
    super(name, age, shootingExperience);
  }

  @Override
  boolean shoot() {
    return hitByChance(0.05 * shootingExperience);
  }
}

class Veteran extends Person {
  Veteran() {}

  Veteran(String name, int age, int shootingExperience) {
    super(name, age, shootingExperience);
  }

  @Override
  boolean shoot() {
    return hitByChance(0.9 - 0.01 * age);
  }
}

public class HomeworkMain {
  static void homework_first_task() {
    MCDonalds mcDonalds1 = new MCDonalds();
    mcDonalds1.addBurger(2500);
    mcDonalds1.addBurger(2700);
    mcDonalds1.addBurger(2200);
    mcDonalds1.addBurger(3000);
    mcDonalds1.addBurger(2600);
    mcDonalds1.addWorker(2000);
    mcDonalds1.addWorker(1800);

    MCDonalds mcDonalds2 = new MCDonalds();
    mcDonalds2.addBurger(2800);
    mcDonalds2.addBurger(3100);
    mcDonalds2.addBurger(3300);
    mcDonalds2.addBurger(2900);
    mcDonalds2.addWorker(2100);
    mcDonalds2.addWorker(2200);
    mcDonalds2.addWorker(1900);

    KFC kfc = new KFC();
    kfc.addBasket(3500);
    kfc.addBasket(3600);
    kfc.addBasket(3400);
    kfc.addBasket(3300);

    City city = new City("Almaty");
    city.addRestaurant(mcDonalds1);
    city.addRestaurant(mcDonalds2);
    city.addRestaurant(kfc);

    System.out.println("Homework 1: Restaurants");
    System.out.printf("City: %s, Total tax: %.2f%n", city.getCityName(), city.getTotalTax());
  }

  static void homework_second_task() {
    Person[] people = new Person[7];
    people[0] = new Newbie("Aruzhan", 19, 2);
    people[1] = new Experienced("Dias", 26, 5);
    people[2] = new Veteran("Marat", 52, 20);
    people[3] = new Experienced("Alina", 31, 7);
    people[4] = new Newbie("Timur", 21, 1);
    people[5] = new Veteran("Bakhyt", 63, 30);
    people[6] = new Experienced("Madina", 29, 6);

    System.out.println("\nHomework 2: Shooting simulation");

    boolean hasHit = false;
    for (int i = 0; i < people.length; i++) {
      boolean shotResult = people[i].shoot();
      System.out.println("Attempt " + (i + 1) + ": " + people[i].getPersonData());
      System.out.println("Result: " + (shotResult ? "HIT" : "MISS"));

      if (shotResult) {
        System.out.println("Simulation finished: target was hit.");
        hasHit = true;
        break;
      }
    }

    if (!hasHit) {
      System.out.println("Simulation finished: nobody hit the target.");
    }
  }

  public static void main(String[] args) {
    homework_first_task();
    homework_second_task();
  }
}
