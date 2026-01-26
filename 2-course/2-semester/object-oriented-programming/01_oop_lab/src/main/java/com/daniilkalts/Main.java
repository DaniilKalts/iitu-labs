import java.util.ArrayList;
import java.util.List;

public class Main {
  /* EASY PROBLEMS */

  public static int easy_sixth_problem(int num) {
    int[] ranks = new int[3];
    for (int i = 0; i < ranks.length; i++) {
      ranks[ranks.length - 1 - i] = num % 10;
      num = num / 10;
    }

    int res = ranks[0] * 100 + ranks[2] * 10 + ranks[1];
    return res;
  }

  public static int easy_seventh_problem(int price) {
    if (price > 10000) {
      return (int) (price * 0.9);   
    } else if (price > 5000) {
      return (int) (price * 0.95);   
    } else {
      return price;
    }
  }

  public static String easy_eighth_problem(int num) {
    int sum = 0;
    while (num > 0) {
      sum += num % 10;
      num = num / 10;
    }

    if (sum < 100) {
      return "Yes";
    }
    return "No";
  }

  public static String easy_ninth_problem(int num) {
    int product = 1;
    while (num > 0) {
      product *= num % 10;
      num = num / 10;
    }

    if (product >= 100) {
      return "Yes";
    }
    return "No";
  }

  public static String easy_tenth_problem(int num) {
    while (num > 0) {
      if (num % 10 == 9) {
        return "Yes";
      }
      num = num / 10;
    }
    return "No";
  }

  /* MEDIUM PROBLEMS */

  public static void medium_sixth_problem() {
    for (int k = 1; k <= 10; k++) {
      float kg = k / 10.0f; 
      float tg = kg * 1000.0f;

      System.out.printf("%.1f kg is %.0f tg%n", kg, tg);
    }
  }

  public static int medium_seventh_problem(int n) {
    int res = 0;
    for (int i = 1; i <= n; i++) {
      res += i * i;
    }
    return res;
  }

  public static int medium_eighth_problem(int n) {
    int res = 0;
    int curr = 0;
    for (int i = 1; i <= n; i++) {
      curr = curr + i;
      res += curr;
    }
    return res;
  }

  public static int medium_ninth_problem(int n) {
    int res = 0;
    int curr = 0;
    for (int i = 1; i <= n; i++) {
      curr = (curr * 10) + 8;
      res += curr;
    }
    return res;
  }

  public static void medium_tenth_problem(int n) {
    int curr = 1;
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        System.out.print(curr++ + " ");
      }
      System.out.println();
    }
  }

  /* HARD PROBLEMS */

  public static int hard_sixth_problem(int num) {
    List<Integer> list = new ArrayList<>();
    while (num > 0) {
      list.add(num % 10);
      num = num  / 10;
    }

    int res = 0;
    for (int i = 0; i < list.size(); i++) {
      res = (res * 10) + list.get(i);
    }

    return res;
  }

  public static int hard_seventh_problem(int n) {
    int last = n % 10;
    int first = 0;
    while (n > 0) {
      first = n % 10;
      n = n / 10;
    }
    return last + first;
  }

  public static int hard_eighth_problem(int n) {
    int res = 0;

    for (int i = n; i > 0; i -= 2) {
      int product = 1;
      for (int j = i; j > 0; j -= 2) {
        product *= j; 
      }
      res += product;
    }
    
    return res;
  }

  public static List<Integer> hard_ninth_problem(int num) {
    List<Integer> list = new ArrayList<>();

    for (int i = 2; i <= num; i++) {
      int count = 2;      
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          count++;
          break;
        } 
      }
      if (count == 2) {
        list.add(i);
      }
    }

    return list;
  }

  public static void main(String[] args) {
    /* EASY PROBLEMS */

    // 6th Problem:
    System.out.println(easy_sixth_problem(132));

    // 7th Problem:
    System.out.println(easy_seventh_problem(12000));

    // 8th Problem:
    System.out.println(easy_eighth_problem(888));

    // 9th Problem:
    System.out.println(easy_ninth_problem(555));

    // // 10th Problem:
    System.out.println(easy_tenth_problem(295));

    System.out.println();
    System.out.println();
    System.out.println();

    /* MEDIUM PROBLEMS */

    // 6th Problem:
    medium_sixth_problem();

    // // 7th Problem:
    System.out.println(medium_seventh_problem(5));

    // // 8th Problem:
    System.out.println(medium_eighth_problem(5));

    // // 9th Problem:
    System.out.println(medium_ninth_problem(3));

    // // // 10th Problem:
    medium_tenth_problem(4);

    System.out.println();
    System.out.println();
    System.out.println();

    /* HARD PROBLEMS */

    // 6th Problem:
    System.out.println(hard_sixth_problem(12345));

    // // 7th Problem:
    System.out.println(hard_seventh_problem(12345));

    // // 8th Problem:
    System.out.println(hard_eighth_problem(5));

    // // 9th Problem:
    System.out.println(hard_ninth_problem(20));
  }
}
