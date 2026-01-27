import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Scanner;

public class Main {
  /* EASY PROBLEMS */

  public static void easy_first_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();
    
    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    for (int i = 0; i < n; i++) {
      if (nums.get(i) > 0) {
        System.out.print(nums.get(i) + " ");
      } 
    }
    System.out.print("\n");
  }

  public static void easy_second_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    int minID = 0, maxID = 0;
    for (int i = 0; i < n; i++) {
      if (nums.get(i) < nums.get(minID)) {
        minID = i;
      } 
      if (nums.get(i) > nums.get(maxID)) {
        maxID = i;
      } 
    }

    System.out.printf("Min ID=%d, Value=%d\n", minID, nums.get(minID));
    System.out.printf("Max ID=%d, Value=%d\n", maxID, nums.get(maxID));
  }

  public static void easy_third_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    int minID = 0, maxID = 0;
    for (int i = 0; i < n; i++) {
      if (nums.get(i) < nums.get(minID)) {
        minID = i;
      } 
      if (nums.get(i) > nums.get(maxID)) {
        maxID = i;
      } 
    }

    int tmp = nums.get(minID);
    nums.set(minID, nums.get(maxID));
    nums.set(maxID, tmp);

    for (int i = 0; i < n; i++) {
      System.out.print(nums.get(i) + " ");
    }
    System.out.print("\n");
  }

  public static void easy_forth_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    for (int i = 0; i < n; i++) {
      if (nums.get(i) > 0) {
        System.out.print(nums.get(i) + " ");
      }
    }
    for (int i = 0; i < n; i++) {
      if (nums.get(i) == 0) {
        System.out.print(nums.get(i) + " ");
      }
    }
    for (int i = 0; i < n; i++) {
      if (nums.get(i) < 0) {
        System.out.print(nums.get(i) + " ");
      }
    }
    System.out.print("\n");
  }

  public static void easy_fifth_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    int product = 1;
    for (int i = 0; i < n; i++) {
      if (nums.get(i) != 0) {
          product *= nums.get(i);
      }
    }
    System.out.println(product);
  }

  public static void easy_sixth_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    int product = 1;
    int geometricNumsCount = 0;
    for (int i = 0; i < n; i++) {
      if (nums.get(i) != 0) {
          product *= nums.get(i);
          geometricNumsCount += 1;
      }
    }

    double geometricMean = Math.pow(product, 1.0/geometricNumsCount);
    System.out.println(geometricMean);
  }

  public static void easy_seventh_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    System.out.print("Enter the number m: ");
    int m = scanner.nextInt();
    scanner.close();

    int count = 0;
    for (int i = 0; i < n; i++) {
      if (nums.get(i) > m) {
          count++;
      }
    }

    System.out.println("Output: " + count);
  }

  /* MEDIUM PROBLEMS */

  public static void medium_first_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    boolean hasMetZero = false;
    int sum = 0;
    for (int i = 0; i < n; i++) {
      if (hasMetZero) {
        sum += nums.get(i);
      }
      if (nums.get(i) == 0) {
        if (hasMetZero == true) {
          System.out.printf("Sum between two zeroes: %d\n", sum);
          return;
        }
        hasMetZero = true;
      }
    }
  }

  public static void medium_second_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    System.out.print("Enter the number m: ");
    int m = scanner.nextInt();
    scanner.close();

    for (int i = 0; i < n; i++) {
      if (nums.get(i) == m) {
          System.out.printf("The index for element %d: %d\n", m, i);
          return;
      }
    }
    System.out.printf("The index for element %d not found\n", m);
  }

  public static void medium_third_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Integer> nums = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      int num = scanner.nextInt();
      nums.add(num);
    }

    scanner.close();

    int leftLargestID = 0;
    int rightLargestID = 0;

    Integer firstMaxID = null;
    Integer secondMaxID = null;
    for (int i = 0; i < n; i++) {
      if (firstMaxID == null || nums.get(i) > nums.get(firstMaxID)) {
        secondMaxID = firstMaxID;
        firstMaxID = i;
      }
      if (secondMaxID == null || nums.get(i) > nums.get(secondMaxID)) {
        secondMaxID = i;
      }
    }

    if (nums.get(leftLargestID) > nums.get(rightLargestID)) {
      System.out.print("The first largest element: " + nums.get(leftLargestID) + "\n");
      System.out.print("The second largest element: " + nums.get(rightLargestID) + "\n");
      return;
    }
    System.out.print("The first largest element: " + nums.get(rightLargestID) + "\n");
    System.out.print("The second largest element: " + nums.get(leftLargestID) + "\n");
  }

  public static void medium_forth_problem() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<ArrayList<Integer>> times = new ArrayList<>();

    System.out.print("Enter the size of Array: ");
    int n = scanner.nextInt();

    System.out.print("Enter the elements of Array: ");
    for (int i = 0; i < n; i++) {
      ArrayList<Integer> record = new ArrayList<>();
      for (int j = 3; j > 0; j--) {
        Integer part = scanner.nextInt();
        record.add(part);
      }
      times.add(record);
    }

    Collections.sort(times, (a, b) -> {
      int hourA = a.get(0), minuteA = a.get(1), secondA = a.get(2);
      int hourB = b.get(0), minuteB = b.get(1), secondB = b.get(2);

      if (hourA != hourB) return Integer.compare(hourA, hourB);
      if (minuteA != minuteB) return Integer.compare(minuteA, minuteB);
      return Integer.compare(secondA, secondB);
    });

    System.out.println();

    for (int i = 0; i < n; i++) {
      ArrayList<Integer> time = times.get(i);
      System.out.println(time.get(0) + ":" + time.get(1) + ":" + time.get(2)); 
    }

    scanner.close();
  }

  /* ARRAY_LIST PROBLEMS */

  public static void array_list_first_problem() {
    Integer[] arr = {1, 2, 3};
    ArrayList<Integer> arrList = new ArrayList<>(Arrays.asList(arr));
    System.out.println(arrList);
  }

  public static void array_list_second_problem() {
    ArrayList<Integer> arrList = new ArrayList<>(Arrays.asList(1, 2, 3));
    Integer[] arr = arrList.toArray(new Integer[0]);
    System.out.println(arr);
  }

  public static void array_list_third_problem() {
    ArrayList<Integer> nums = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));    

    Scanner scanner = new Scanner(System.in);

    System.out.print("Enter the element to find in array: ");
    int n = scanner.nextInt();
    scanner.close();

    for (int i = 0; i < nums.size(); i++) {
      if (nums.get(i) == n) {
          System.out.printf("The index for element %d: %d\n", n, i);
          return;
      }
    }
    System.out.printf("The index for element %d not found\n", n);
  }

  public static void array_list_forth_problem() {
    ArrayList<Integer> nums = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));    

    Scanner scanner = new Scanner(System.in);

    System.out.print("Enter the first index to swap: ");
    int n = scanner.nextInt();

    System.out.print("Enter the second index to swap: ");
    int m = scanner.nextInt();

    scanner.close();

    for (int i = 0; i < nums.size(); i++) {
      System.out.print(nums.get(i) + " ");
    }
    System.out.println();

    Integer tmp = nums.get(n);
    nums.set(n, nums.get(m));
    nums.set(m, tmp);

    for (int i = 0; i < nums.size(); i++) {
      System.out.print(nums.get(i) + " ");
    }
    System.out.println();
  }

  public static void main(String[] args) {
    /* EASY PROBLEMS */
    // easy_first_problem();
    // easy_second_problem();
    // easy_third_problem();
    // easy_forth_problem();
    // easy_fifth_problem();
    // easy_sixth_problem();
    // easy_seventh_problem();

    /* MEDIUM PROBLEMS */
    // medium_first_problem();
    // medium_second_problem();
    // medium_third_problem();
    medium_forth_problem();

    /* ARRAY_LIST PROBLEMS */
    // array_list_first_problem();
    // array_list_second_problem();
    // array_list_third_problem();
    // array_list_forth_problem();
  }
}
