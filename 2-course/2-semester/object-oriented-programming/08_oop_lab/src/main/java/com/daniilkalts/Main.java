import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class CountingThread extends Thread {
  private final int delay;

  CountingThread(String name, int delay) {
    super(name);
    this.delay = delay;
  }

  @Override
  public void run() {
    for (int i = 1; i <= 10; i++) {
      System.out.println(getName() + ": " + i);
      try {
        Thread.sleep(delay);
      } catch (InterruptedException e) {
        interrupt();
        return;
      }
    }
  }
}

class RaceResult {
  String name;
  int seconds;
  int finishOrder;

  RaceResult(String name, int seconds, int finishOrder) {
    this.name = name;
    this.seconds = seconds;
    this.finishOrder = finishOrder;
  }
}

class Car extends Thread {
  static int finishLine;
  static final List<RaceResult> results = Collections.synchronizedList(new ArrayList<>());
  static int currentPlace = 1;

  private final String carName;
  private final int speed;

  Car(String carName, int speed) {
    this.carName = carName;
    this.speed = speed;
  }

  @Override
  public void run() {
    int distance = 0;
    int seconds = 0;

    while (distance < finishLine) {
      try {
        Thread.sleep(1000);
      } catch (InterruptedException e) {
        interrupt();
        return;
      }

      seconds++;
      distance += speed;
      if (distance > finishLine) {
        distance = finishLine;
      }
      System.out.println(carName + " is in " + distance + " meters");
    }

    synchronized (Car.class) {
      results.add(new RaceResult(carName, seconds, currentPlace));
      currentPlace++;
    }
  }
}

public class Main {
  public static void main(String[] args) throws InterruptedException {
    runTask1();
    System.out.println();
    runTask2();
  }

  private static void runTask1() throws InterruptedException {
    ArrayList<CountingThread> threads = new ArrayList<>();

    for (int i = 1; i <= 10; i++) {
      threads.add(new CountingThread("Thread " + i, i * 50));
    }

    for (int i = 0; i < threads.size(); i++) {
      threads.get(i).start();
    }

    for (int i = 0; i < threads.size(); i++) {
      threads.get(i).join();
    }
  }

  private static void runTask2() throws InterruptedException {
    Car.finishLine = 1000;
    Car.results.clear();
    Car.currentPlace = 1;

    ArrayList<Car> cars = new ArrayList<>();
    cars.add(new Car("Ferrari 1", 200));
    cars.add(new Car("Mercedes 1", 180));
    cars.add(new Car("Renault 2", 160));
    cars.add(new Car("BMW 1", 150));
    cars.add(new Car("Audi 1", 140));
    cars.add(new Car("Porsche 1", 130));
    cars.add(new Car("Lamborghini 1", 125));
    cars.add(new Car("McLaren 1", 120));
    cars.add(new Car("Toyota 1", 110));
    cars.add(new Car("Honda 1", 100));

    for (int i = 0; i < cars.size(); i++) {
      cars.get(i).start();
    }

    for (int i = 0; i < cars.size(); i++) {
      cars.get(i).join();
    }

    Car.results.sort(Comparator.comparingInt((RaceResult result) -> result.seconds)
        .thenComparingInt(result -> result.finishOrder));

    for (int i = 0; i < Car.results.size(); i++) {
      RaceResult result = Car.results.get(i);
      System.out.println("Place " + (i + 1) + ": " + result.name + " - " + result.seconds + " seconds");
    }
  }
}
