#include <cmath>   // Mathematical functions
#include <iomanip> // Input Output manipulation functions
#include <iostream>

/* ========= Utility Functions: ========= */

bool validate_positive_input(int n) {
  if (n <= 0) {
    std::cout << "Error: Invalid number " << n
              << " is negative or equals to zero.\n\n";
    std::cout << "====================\n\n";
    return false;
  }
  return true;
}

/* ============================== */

/* ========= Solutions: ========= */

void solution_1() {
  std::cout << "Solution 1:\n\n";

  int k, n;

  std::cout << "Enter an integer K: ";
  std::cin >> k;
  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  if (!validate_positive_input(n))
    return;

  for (int i = 0; i < n; i++) {
    std::cout << i + 1 << " iteration, the number k is: " << k << ".\n";
  }

  std::cout << "\n";

  std::cout << "====================\n\n";
}

void solution_2() {
  std::cout << "Solution 2:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  if (!validate_positive_input(n))
    return;

  for (int i = n; i >= 0; i--) {
    std::cout << n - i + 1 << " iteration, the number: " << i << ".\n";
  }

  std::cout << "\n";

  std::cout << "====================\n\n";
}

void solution_3() {
  std::cout << "Solution 3:\n\n";

  int a, b;

  std::cout << "Enter an integer A: ";
  std::cin >> a;
  std::cout << "Enter an integer B: ";
  std::cin >> b;

  std::cout << "\n";

  if (!(a < b)) {
    std::cout << "Error: The number a = " << a << " needs to be less "
              << "than the number b = " << b << ".\n\n";
    return;
  }

  std::cout << "The digits between " << a << " and " << b << " are: ";

  while (a <= b) {
    std::cout << a << " ";
    a += 1;
  }

  std::cout << "\n";

  std::cout << "====================\n\n";
}

void solution_4() {
  std::cout << "Solution 4:\n\n";

  int n;

  std::cout << "Enter an integer N: ";
  std::cin >> n;

  std::cout << "\n";

  std::cout << "The even digits between " << n << " are: ";

  if (n < 1) {
    for (int i = n; i <= 0; i++) {
      if (i % 2 == 0) {
        std::cout << i << " ";
      }
    }
  } else if (n > 1) {
    for (int i = 0; i <= n; i++) {
      if (i % 2 == 0) {
        std::cout << i << " ";
      }
    }
  }

  std::cout << "\n\n";

  std::cout << "====================\n\n";
}

void solution_5() {
  std::cout << "Solution 5:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  if (!validate_positive_input(n))
    return;

  long long result = 1;

  for (int i = 1; i <= n; i++) {
    result *= i;
  }

  std::cout << "The factorial of number " << n << " is " << result << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_6() {
  std::cout << "Solution 6:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  double result = 0;

  if (!validate_positive_input(n))
    return;

  std::cout << "Sum of the first " << n << " elements of the sequence: ";

  for (double i = 1; i <= n; i++) {
    if (i < n) {
      std::cout << "1 / " << i << " + ";
    } else {
      std::cout << "1 / " << i << ".\n\n";
    }

    result += 1 / i;
  }
  std::cout << std::fixed << std::setprecision(5);
  std::cout << "The result equals to: " << result << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_7() {
  std::cout << "Solution 7:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  int result = 0;

  if (!validate_positive_input(n))
    return;

  std::cout << "Sum of the first " << n << " elements of the sequence: ";

  for (int i = 1; i <= n; i++) {
    if (i % 2 == 1) {
      result += i * 2;
    } else {
      result -= i * 2;
    }
  }

  std::cout << "The result equals to: " << result << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_8() {
  std::cout << "Solution 8:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  double result = 0;

  if (!validate_positive_input(n))
    return;

  std::cout << "Sum of the first " << n << " elements of the sequence: ";

  for (int i = 0; i < n; i++) {
    double current_element = 2 * i + 1;

    if (i % 2 == 0) {
      result += 1 / current_element;
    } else {
      result -= 1 / current_element;
    }

    if (i + 1 < n) {
      if (i % 2 == 0) {
        std::cout << "1 / " << current_element << " - ";
      } else {
        std::cout << "1 / " << current_element << " + ";
      }
    } else {
      std::cout << "1 / " << current_element << ".\n\n";
    }
  }

  std::cout << std::fixed << std::setprecision(6);
  std::cout << "The result equals to: " << result << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_9() {
  std::cout << "Solution 9:\n\n";

  int n;
  int count_of_integers = 1;
  int sum_of_integers = 0;

  while (n != 0) {
    std::cout << "Enter an integer N (0 to stop): ";
    std::cin >> n;

    count_of_integers += 1;
    sum_of_integers += n;
  }

  std::cout << "\n";

  std::cout << "The sum of integers equals to: " << sum_of_integers << ".\n";
  std::cout << "The average number equals to: "
            << static_cast<double>(sum_of_integers) / count_of_integers
            << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_10() {
  std::cout << "Solution 10:\n\n";

  int n;
  int sum_of_odd_integers = 0;

  while (n != 0) {
    std::cout << "Enter an integer N (0 to stop): ";
    std::cin >> n;

    sum_of_odd_integers += n % 2 == 1 ? n : 0;
  }

  std::cout << "\n";

  std::cout << "The sum of all odd integers equals to: " << sum_of_odd_integers
            << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_11() {
  std::cout << "Solution 11:\n\n";

  int n;

  std::cout << "Enter a positive integer N: ";
  std::cin >> n;

  std::cout << "\n";

  long long current_factorial = 1;
  long long sum_of_factorials = 0;

  if (!validate_positive_input(n))
    return;

  for (int i = 1; i <= n; i++) {
    current_factorial *= i;
    sum_of_factorials += current_factorial;
  }

  std::cout << "The sum_of_factorials equals to: " << sum_of_factorials
            << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_12() {
  std::cout << "Solution 12:\n\n";

  int a, b;

  std::cout << "Enter an integer A: ";
  std::cin >> a;
  std::cout << "Enter an integer B: ";
  std::cin >> b;

  std::cout << "\n";

  if (!(a < b)) {
    std::cout << "Error: The number a = " << a << " needs to be less "
              << "than the number b = " << b << ".\n\n";
    return;
  }

  if (!validate_positive_input(a) || !validate_positive_input(b))
    return;

  while (a <= b) {
    for (int i = 0; i < a; i++) {
      std::cout << a << " ";
    }
    a += 1;

    std::cout << "\n";
  }

  std::cout << "\n";

  std::cout << "====================\n\n";
}

void solution_13() {
  std::cout << "Solution 13:\n\n";

  int a;

  std::cout << "Enter an integer A: ";
  std::cin >> a;

  std::cout << "\n";

  int result = 0;

  if (a > 0) {
    while (a > 0) {
      result += a % 10;
      a = a / 10;
    }
  } else if (a < 0) {
    while (a < 0) {
      result += a % 10;
      a = a / 10;
    }
  }

  std::cout << "The sum of all digits equals to: " << result << ".\n\n";

  std::cout << "====================\n\n";
}

void solution_14() {
  std::cout << "Solution 14:\n\n";

  int n;

  std::cout << "Enter an integer N: ";
  std::cin >> n;

  std::cout << "\n";

  bool has_two = false;

  if (n > 0) {
    while (n > 0 && !has_two) {
      has_two = n % 10 == 2;
      n = n / 10;
    }
  } else if (n < 0) {
    while (n < 0 && !has_two) {
      has_two = n % 10 == -2;
      n = n / 10;
    }
  }

  std::cout << "This number" << (has_two ? " has " : " hasn't ")
            << "the digit 2.\n\n";

  std::cout << "====================\n\n";
}

void solution_15() {
  std::cout << "Solution 15:\n\n";

  int n;

  std::cout << "Enter an integer N: ";
  std::cin >> n;

  std::cout << "\n";

  int result = 0;
  int i = 0;

  while (n > 0) {
    int last_digit = n % 10;

    result += last_digit * std::pow(2, i);

    n /= 10;
    i++;
  }

  std::cout << "This number in decimal equals to " << result << " .\n\n";

  std::cout << "====================\n\n";
}

/* ============================== */

int main() {
  //// 1 Task
  // solution_1();

  //// 2 Task
  // solution_2();

  //// 3 Task
  // solution_3();

  //// 4 Task
  // solution_4();

  //// 5 Task
  // solution_5();

  //// 6 Task
  // solution_6();

  //// 7 Task
  // solution_7();

  //// 8 Task
  // solution_8();

  //// 9 Task
  // solution_9();

  //// 10 Task
  // solution_10();

  //// 11 Task
  // solution_11();

  //// 12 Task
  // solution_12();

  //// 13 Task
  // solution_13();

  //// 14 Task
  // solution_14();

  //// 15 Task
  // solution_15();
}
