class Car {
  String name;
  String model;
  int maxSpeed;
  double engineVolume;

  Car() {}

  Car(String name, String model, int maxSpeed, double engineVolume) {
    this.name = name;
    this.model = model;
    this.maxSpeed = maxSpeed;
    this.engineVolume = engineVolume;
  }

  @Override
  public String toString() {
    return "Car: " + name + " " + model + ", " + maxSpeed + "km/h, " + engineVolume + " liters";
  }

  void ride() {
    if (engineVolume > 2.2) {
      System.out.println("Car is riding");
    } else {
      System.out.println("Couldn't start engine");
    }
  }
}

class Player {
  String name;
  String position;
  int number;
  boolean isInjured;

  Player() {}

  Player(String name, String position, int number, boolean isInjured) {
    this.name = name;
    this.position = position;
    this.number = number;
    this.isInjured = isInjured;
  }

  String getPlayerData() {
    return "Player: " + name + ", Position: " + position + ", Number: " + number + ", Injured: " + isInjured;
  }
}

class Club {
  String name;
  Player[] players;

  Club() {}

  Club(String name, Player[] players) {
    this.name = name;
    this.players = players;
  }

  void printClubData() {
    System.out.println("Club: " + name);
    for (int i = 0; i < players.length; i++) {
      System.out.println(players[i].getPlayerData());
    }
  }

  void printSquad() {
    for (int i = 0; i < players.length; i++) {
      if (players[i].isInjured == false) {
        System.out.println(players[i].number + " " + players[i].name + " " + players[i].position);
      }
    }
  }
}

public class ClassworkMain {
  public static void classwork_first_task() {
    Car[] cars = new Car[] {
      new Car("Toyota", "Camry", 200, 2.5),
      new Car("BMW", "X5", 250, 3.0),
      new Car("Mercedes", "E-Class", 240, 3.5),
      new Car("Honda", "Civic", 180, 1.8),
      new Car("Ford", "Mustang", 260, 5.0)
    };

    for (int i = 0; i < cars.length; i++) {
      cars[i].ride();
    }
  }

  public static void classwork_second_task() {
    Car[] cars = new Car[] {
      new Car("Toyota", "Camry", 200, 2.5),
      new Car("BMW", "X5", 250, 3.0),
      new Car("Mercedes", "E230", 240, 2.4),
      new Car("Honda", "Civic", 180, 1.8),
      new Car("Ford", "Mustang", 260, 5.0),
      new Car("Audi", "A6", 240, 2.8),
      new Car("Hyundai", "Elantra", 190, 2.0),
      new Car("Kia", "K5", 210, 2.2),
      new Car("Nissan", "Altima", 205, 2.5),
      new Car("Chevrolet", "Camaro", 290, 6.2)
    };

    int maxID = 0;
    for (int i = 1; i < cars.length; i++) {
      if (cars[i].maxSpeed > cars[maxID].maxSpeed) {
        maxID = i;
      }
    }
    System.out.println(cars[maxID].toString());
  }

  public static void classwork_third_task() {
    Player[] players = new Player[] {
      new Player("Neuer", "GK", 1, false),
      new Player("Carvajal", "RB", 2, false),
      new Player("Ramos", "CDF", 4, false),
      new Player("Kante", "CB", 6, false),
      new Player("Griezmann", "FWD", 7, false),
      new Player("Silva", "CM", 10, true)
    };

    Club club = new Club("Dream FC", players);
    club.printClubData();
    club.printSquad();
  }

  public static void main(String[] args) {
    // classwork_first_task();
    // classwork_second_task();
    classwork_third_task();
  }
}
