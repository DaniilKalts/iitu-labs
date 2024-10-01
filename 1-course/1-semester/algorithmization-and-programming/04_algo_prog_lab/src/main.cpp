#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <limits>
#include <map>

/*======= Utility Functions: =======*/

int get_valid_input(const std::string &prompt, int min,
                    int max = std::numeric_limits<int>::max()) {
  int input;

  do {
    std::cout << prompt;
    std::cin >> input;

    if (std::cin.fail() || input < min || input > max) {
      std::cout << "Invalid input: please enter a number between " << min
                << " and " << max << ".\n\n";
      std::cin.clear();
      std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    }
  } while (std::cin.fail() || input < min || input > max);

  std::cout << "\n";
  return input;
}

/*==================================*/

/*============ Solutions ============*/

void solution_1() {
  std::cout << "1 task.\n\n";

  int n = get_valid_input("Enter a positive integer N (N > 0): ", 1);

  int *power_arr = new int[n];

  for (int i = 0; i < n; i++) {
    power_arr[i] = 1 << (i + 1);
  }

  std::cout << "The array contains the following powers of 2: ";
  for (int i = 0; i < n; i++) {
    std::cout << power_arr[i] << " ";
  }

  delete[] power_arr;

  std::cout << "\n\n================\n\n";
}

void solution_2() {
  std::cout << "2 task.\n\n";

  int n = get_valid_input("Enter a positive integer N (N > 1): ", 2);
  int a = get_valid_input("Enter the first term A: ",
                          std::numeric_limits<int>::min());
  int d = get_valid_input("Enter the common difference D: ",
                          std::numeric_limits<int>::min());

  int *progression_arr = new int[n];

  for (int i = 0; i < n; i++) {
    progression_arr[i] = a + d * i;
  }

  std::cout << "The array contains the following progression terms: ";
  for (int i = 0; i < n; i++) {
    std::cout << progression_arr[i] << (i < n - 1 ? ", " : "");
  }

  delete[] progression_arr;

  std::cout << "\n\n================\n\n";
}

void solution_3() {
  std::cout << "3 task.\n\n";

  int n = get_valid_input("Enter a positive integer N (N > 2): ", 3);

  int *fibonacci_arr = new int[n];
  fibonacci_arr[0] = 1;
  fibonacci_arr[1] = 1;

  for (int i = 2; i < n; i++) {
    fibonacci_arr[i] = fibonacci_arr[i - 2] + fibonacci_arr[i - 1];
  }

  std::cout << "The array contains the following Fibonacci sequence: ";
  for (int i = 0; i < n; i++) {
    std::cout << fibonacci_arr[i] << " ";
  }

  delete[] fibonacci_arr;

  std::cout << "\n\n================\n\n";
}

void solution_4() {
  std::cout << "4 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  std::cout << "\nThe even numbers: ";
  for (int i = 0; i < n; i++) {
    if (int_arr[i] % 2 == 0) {
      std::cout << int_arr[i] << " ";
    }
  }

  std::cout << "\nThe odd numbers in reverse order: ";
  for (int i = n - 1; i >= 0; i--) {
    if (int_arr[i] % 2 == 1) {
      std::cout << int_arr[i] << " ";
    }
  }

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_5() {
  std::cout << "5 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  std::cout << "\nThe elements in zigzag order: ";
  for (int i = 0; i < n / 2; i++) {
    std::cout << int_arr[i] << " " << int_arr[n - i - 1] << " ";
  }

  if (n % 2 == 1) {
    std::cout << int_arr[n / 2];
  }

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_6() {
  std::cout << "6 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int K = get_valid_input("Enter the starting position K (1 ≤ K ≤ N): ", 1, n);
  int L = get_valid_input("Enter the ending position L (K ≤ L ≤ N): ", K, n);

  K--;
  L--;

  int sum = 0;
  for (int i = K; i <= L; i++) {
    sum += int_arr[i];
  }

  double mean = static_cast<double>(sum) / (L - K + 1);

  std::cout << "The arithmetic mean of the elements from position " << K + 1
            << " to " << L + 1 << " is: " << mean << "\n";

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_7() {
  std::cout << "7 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int K = get_valid_input("Enter the starting position K (1 ≤ K ≤ N): ", 1, n);
  int L = get_valid_input("Enter the ending position L (K ≤ L ≤ N): ", K, n);

  K--;
  L--;

  int result_sum = 0;
  for (int i = 0; i < n; i++) {
    if (i < K || i > L) {
      result_sum += int_arr[i];
    }
  }

  std::cout << "The sum of all elements excluding those from position " << K + 1
            << " to " << L + 1 << " is: " << result_sum << "\n";

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_8() {
  std::cout << "8 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 1): ", 2);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  std::sort(int_arr, int_arr + n);

  bool has_duplicates = false;

  for (int i = 1; i < n; i++) {
    if (int_arr[i] == int_arr[i - 1]) {
      has_duplicates = true;
      break;
    }
  }

  if (has_duplicates) {
    std::cout << "The array contains duplicate elements. Output: 0\n";
  } else {
    int common_difference = int_arr[1] - int_arr[0];
    bool is_arithmetic = true;

    for (int i = 2; i < n; i++) {
      if (int_arr[i] - int_arr[i - 1] != common_difference) {
        is_arithmetic = false;
        break;
      }
    }

    if (is_arithmetic) {
      std::cout << "The array forms an arithmetic progression with a common "
                   "difference of: "
                << common_difference << "\n";
    } else {
      std::cout
          << "The array does not form an arithmetic progression. Output: 0\n";
    }
  }

  delete[] int_arr;

  std::cout << "\n================\n\n";
}

void solution_9() {
  std::cout << "9 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int min_even_index_element = std::numeric_limits<int>::max();

  for (int i = 0; i < n; i += 2) {
    if (int_arr[i] < min_even_index_element) {
      min_even_index_element = int_arr[i];
    }
  }

  std::cout << "The smallest element among those with even indices is: "
            << min_even_index_element << ".";

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_10() {
  std::cout << "10 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 1): ", 2);

  int *int_arr = new int[n];
  int *index_arr = new int[n];
  int count = 0;

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  for (int i = 0; i < n - 1; i++) {
    if (int_arr[i] > int_arr[i + 1]) {
      index_arr[count] = i;
      count++;
    }
  }

  std::cout << "Number of elements greater than their right neighbor: " << count
            << "\n";
  if (count > 0) {
    std::cout << "Indices of such elements: ";
    for (int i = 0; i < count; i++) {
      std::cout << index_arr[i] << " ";
    }
    std::cout << "\n";
  }

  delete[] int_arr;
  delete[] index_arr;

  std::cout << "\n\n================\n\n";
}

void solution_11() {
  std::cout << "11 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 2): ", 3);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  for (int i = 1; i < n - 1; i++) {
    if (int_arr[i] < int_arr[i - 1] && int_arr[i] < int_arr[i + 1]) {
      std::cout << "The first local minimum is at index: " << i << ".";
      delete[] int_arr;
      std::cout << "\n\n================\n\n";
      return;
    }
  }

  std::cout << "No local minimum found.";

  delete[] int_arr;
  std::cout << "\n\n================\n\n";
}

void solution_12() {
  std::cout << "12 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 1): ", 2);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int min_idx = 0, max_idx = 0;

  for (int i = 1; i < n; i++) {
    if (int_arr[i] < int_arr[min_idx]) {
      min_idx = i;
    }
    if (int_arr[i] > int_arr[max_idx]) {
      max_idx = i;
    }
  }

  if (min_idx > max_idx) {
    std::swap(min_idx, max_idx);
  }

  if (max_idx - min_idx > 1) {
    for (int i = min_idx + 1; i < max_idx; i++) {
      int_arr[i] = 0;
    }
  }

  std::cout
      << "Array after setting to zero the elements between min and max:\n";
  for (int i = 0; i < n; i++) {
    std::cout << int_arr[i] << " ";
  }

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_13() {
  std::cout << "13 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 2): ", 3);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int max_local_minimum = std::numeric_limits<int>::min();
  bool found_local_minimum = false;

  for (int i = 1; i < n - 1; i++) {
    if (int_arr[i] < int_arr[i - 1] && int_arr[i] < int_arr[i + 1]) {
      if (!found_local_minimum || int_arr[i] > max_local_minimum) {
        max_local_minimum = int_arr[i];
        found_local_minimum = true;
      }
    }
  }

  if (found_local_minimum) {
    std::cout << "The maximum of the local minimums is: " << max_local_minimum
              << ".";
  } else {
    std::cout << "No local minimum found in the array.";
  }

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_14() {
  std::cout << "14 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 1): ", 2);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  int segments_count = 0;
  int trend = 0;

  for (int i = 1; i < n; i++) {
    if (int_arr[i] > int_arr[i - 1]) {
      if (trend != 1) {
        segments_count++;
        trend = 1; // Increasing segment
      }
    } else if (int_arr[i] < int_arr[i - 1]) {
      if (trend != -1) {
        segments_count++;
        trend = -1; // Decreasing segment
      }
    }
  }

  std::cout << "The number of monotonic segments in the array is: "
            << segments_count << ".";

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_15() {
  std::cout << "15 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];

  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  std::map<int, int> frequency_map;

  // Count the frequency of each element in the array
  for (int i = 0; i < n; i++) {
    frequency_map[int_arr[i]]++;
  }

  int unique_count = 0;

  // Count how many elements have a frequency of exactly 1
  for (const auto &pair : frequency_map) {
    if (pair.second == 1) {
      unique_count++;
    }
  }

  std::cout << "The number of truly unique elements in the array is: "
            << unique_count << ".";

  delete[] int_arr;

  std::cout << "\n\n================\n\n";
}

void solution_16() {
  std::cout << "16 task.\n\n";

  int n = get_valid_input("Enter the size of the array (N > 0): ", 1);

  int *int_arr = new int[n];
  std::cout << "Enter " << n << " integers for the array:\n";
  for (int i = 0; i < n; i++) {
    std::cin >> int_arr[i];
  }

  std::map<int, int> element_count;

  for (int i = 0; i < n; i++) {
    if (int_arr[i] < 1 || int_arr[i] > n) {
      delete[] int_arr; // Free memory before returning
      std::cout << "false\n";
      return;
    }
    element_count[int_arr[i]]++;
  }

  for (int i = 1; i <= n; i++) {
    if (element_count[i] != 1) {
      delete[] int_arr; // Free memory before returning
      std::cout << "false\n";
      return;
    }
  }

  delete[] int_arr;
  std::cout << "true\n";
}

/*=============================*/

int main() {
  std::cout << "Full Name: Kalts Daniil.\n";
  std::cout << "Group: IT2-2404SE.";

  std::cout << "\n\n";

  std::cout << "================";

  std::cout << "\n\n";

  std::cout << "4 laboratory work:";

  std::cout << "\n\n";

  std::cout << "================";

  std::cout << "\n\n";

  // 1 task
  // solution_1();

  // 2 task
  // solution_2();

  // 3 task
  // solution_3();

  // 4 task
  // solution_4();

  // 5 task
  // solution_5();

  // 6 task
  // solution_6();

  // 7 task
  // solution_7();

  // 8 task
  // solution_8();

  // 9 task
  // solution_9();

  // 10 task
  // solution_10();

  // 11 task
  // solution_11();

  // 12 task
  // solution_12();

  // 13 task
  // solution_13();

  // 14 task
  // solution_14();

  // 15 task
  // solution_15();

  // 16 task
  // solution_16();

  return 0;
}
