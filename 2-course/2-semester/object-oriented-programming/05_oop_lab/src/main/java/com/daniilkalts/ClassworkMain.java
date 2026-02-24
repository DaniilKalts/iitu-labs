abstract class Engine {
  private double engineVolume;
  private int cylinderAmount;
  private double engineWeight;

  Engine() {}

  Engine(double engineVolume, int cylinderAmount, double engineWeight) {
    this.engineVolume = engineVolume;
    this.cylinderAmount = cylinderAmount;
    this.engineWeight = engineWeight;
  }

  double getEngineVolume() {
    return engineVolume;
  }

  void setEngineVolume(double engineVolume) {
    this.engineVolume = engineVolume;
  }

  int getCylinderAmount() {
    return cylinderAmount;
  }

  void setCylinderAmount(int cylinderAmount) {
    this.cylinderAmount = cylinderAmount;
  }

  double getEngineWeight() {
    return engineWeight;
  }

  void setEngineWeight(double engineWeight) {
    this.engineWeight = engineWeight;
  }

  abstract double efficiency();

  abstract double throttleEnergy();

  abstract double breakEnergy();

  double getMaxSpeed() {
    return (throttleEnergy() - breakEnergy()) * efficiency();
  }
}

class FerrariEngine extends Engine {
  FerrariEngine() {}

  FerrariEngine(double engineVolume, int cylinderAmount, double engineWeight) {
    super(engineVolume, cylinderAmount, engineWeight);
  }

  @Override
  double efficiency() {
    return 0.25;
  }

  @Override
  double throttleEnergy() {
    return getEngineVolume() * getCylinderAmount() * 100;
  }

  @Override
  double breakEnergy() {
    return getEngineWeight() * 2;
  }
}

class RenaultEnigine extends Engine {
  private double extraTurboEnergy;

  RenaultEnigine() {}

  RenaultEnigine(double engineVolume, int cylinderAmount, double engineWeight, double extraTurboEnergy) {
    super(engineVolume, cylinderAmount, engineWeight);
    this.extraTurboEnergy = extraTurboEnergy;
  }

  double getExtraTurboEnergy() {
    return extraTurboEnergy;
  }

  void setExtraTurboEnergy(double extraTurboEnergy) {
    this.extraTurboEnergy = extraTurboEnergy;
  }

  @Override
  double efficiency() {
    return 0.27;
  }

  @Override
  double throttleEnergy() {
    return getEngineVolume() * getCylinderAmount() * 110 + extraTurboEnergy;
  }

  @Override
  double breakEnergy() {
    return getEngineWeight() * 2.1;
  }
}

interface Workers {
  String getWorkerData();

  int getSalary();
}

class Staff implements Workers {
  private int id;
  private String name;
  private String surname;
  private int salary;

  Staff() {}

  Staff(int id, String name, String surname, int salary) {
    this.id = id;
    this.name = name;
    this.surname = surname;
    this.salary = salary;
  }

  @Override
  public String getWorkerData() {
    return "Staff -> ID: " + id + ", Name: " + name + " " + surname + ", Salary: " + getSalary();
  }

  @Override
  public int getSalary() {
    return salary;
  }
}

class HRManagers implements Workers {
  private int id;
  private String fullName;
  private int salary;

  HRManagers() {}

  HRManagers(int id, String fullName, int salary) {
    this.id = id;
    this.fullName = fullName;
    this.salary = salary;
  }

  @Override
  public String getWorkerData() {
    return "HR Manager -> ID: " + id + ", Full Name: " + fullName + ", Salary: " + getSalary();
  }

  @Override
  public int getSalary() {
    return salary;
  }
}

class Programmers implements Workers {
  private int id;
  private String nickname;
  private int salary;
  private int bonusSalary;
  private double KPIValue;

  Programmers() {}

  Programmers(int id, String nickname, int salary, int bonusSalary, double KPIValue) {
    this.id = id;
    this.nickname = nickname;
    this.salary = salary;
    this.bonusSalary = bonusSalary;
    this.KPIValue = KPIValue;
  }

  @Override
  public String getWorkerData() {
    return "Programmer -> ID: " + id + ", Nickname: " + nickname + ", Base Salary: " + salary
        + ", Bonus Salary: " + bonusSalary + ", KPI: " + KPIValue + ", Final Salary: " + getSalary();
  }

  @Override
  public int getSalary() {
    return salary + (int) Math.round(KPIValue * bonusSalary);
  }
}

public class ClassworkMain {
  static void classwork_first_task() {
    Engine[] engines = new Engine[10];
    int size = 0;

    engines[size++] = new FerrariEngine(3.0, 8, 190);
    engines[size++] = new FerrariEngine(3.9, 12, 220);
    engines[size++] = new FerrariEngine(2.0, 6, 170);
    engines[size++] = new FerrariEngine(4.5, 10, 240);
    engines[size++] = new FerrariEngine(6.3, 12, 280);

    engines[size++] = new RenaultEnigine(1.6, 4, 120, 50);
    engines[size++] = new RenaultEnigine(2.0, 4, 130, 70);
    engines[size++] = new RenaultEnigine(1.4, 4, 115, 40);
    engines[size++] = new RenaultEnigine(2.2, 6, 150, 90);
    engines[size++] = new RenaultEnigine(3.0, 6, 175, 110);

    System.out.println("Task 1: Engines max speed");
    for (int i = 0; i < size; i++) {
      System.out.printf("Engine #%d max speed: %.2f%n", i + 1, engines[i].getMaxSpeed());
    }
  }

  static void classwork_second_task() {
    Workers[] workers = new Workers[15];
    int size = 0;

    workers[size++] = new Staff(1, "Aruzhan", "Sadykova", 210000);
    workers[size++] = new Staff(2, "Dias", "Nurgali", 225000);
    workers[size++] = new Staff(3, "Alina", "Serik", 205000);
    workers[size++] = new Staff(4, "Timur", "Amanov", 230000);
    workers[size++] = new Staff(5, "Madina", "Kairat", 240000);

    workers[size++] = new HRManagers(6, "Azamat Nurpeisov", 260000);
    workers[size++] = new HRManagers(7, "Anel Sabitova", 275000);
    workers[size++] = new HRManagers(8, "Maksat Orynbek", 250000);
    workers[size++] = new HRManagers(9, "Aiman Tulegen", 265000);
    workers[size++] = new HRManagers(10, "Marat Kenzhebek", 285000);

    workers[size++] = new Programmers(11, "neo", 420000, 120000, 0.85);
    workers[size++] = new Programmers(12, "alice", 390000, 100000, 0.90);
    workers[size++] = new Programmers(13, "byte", 410000, 150000, 0.70);
    workers[size++] = new Programmers(14, "pixel", 370000, 95000, 1.00);
    workers[size++] = new Programmers(15, "qwerty", 450000, 130000, 0.60);

    Workers bestPaidWorker = workers[0];
    for (int i = 1; i < size; i++) {
      if (workers[i].getSalary() > bestPaidWorker.getSalary()) {
        bestPaidWorker = workers[i];
      }
    }

    System.out.println("\nTask 2: Workers");
    System.out.println("Highest salary worker:");
    System.out.println(bestPaidWorker.getWorkerData());

    for (int i = 0; i < size - 1; i++) {
      for (int j = 0; j < size - 1 - i; j++) {
        if (workers[j].getSalary() < workers[j + 1].getSalary()) {
          Workers tmp = workers[j];
          workers[j] = workers[j + 1];
          workers[j + 1] = tmp;
        }
      }
    }

    System.out.println("\nWorkers sorted by salary (DESC):");
    for (int i = 0; i < size; i++) {
      System.out.println((i + 1) + ") " + workers[i].getWorkerData());
    }
  }

  public static void main(String[] args) {
    classwork_first_task();
    classwork_second_task();
  }
}
