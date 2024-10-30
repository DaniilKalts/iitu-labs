#include <iostream>

/*============ Solutions ============*/

void solution_1() {
  std::cout << "1 task.\n\n";

  int n = -1;
  while (!(n >= 1)) {
    std::cout << "Enter the length of array (N >= 1): ";
    std::cin >> n;
  }

  int k = 0;
  while (!(k > 0 && k <= n)) {
    std::cout << "Enter the Kth element to remove (K >= 1 and K <= N): ";
    std::cin >> k;
  }
  std::cout << std::endl;

  k -= 1;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n - 1];
  for (int i = 0; i < n; i++) {
    if (i < k) {
      new_arr[i] = arr[i];
    } else if (i > k) {
      new_arr[i - 1] = arr[i];
    }
  }
  n = n - 1;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed element at position " << k + 1 << ": ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_2() {
  std::cout << "2 task.\n\n";

  int n = -1;
  while (!(n >= 2)) {
    std::cout << "Enter the length of array (N >= 2): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int k = n;
  while (!(k >= 1 && k <= n - 1)) {
    std::cout << "Enter the start position to remove (K >= 1 and K <= N - 1): ";
    std::cin >> k;
  }

  int l = k;
  while (!(l > k && l <= n)) {
    std::cout << "Enter the end position to remove (K < L <= N): ";
    std::cin >> l;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  k -= 1;
  l -= 1;

  int new_arr_length = n - (l - k + 1);
  int *new_arr = new int[n - (l - k + 1)];
  int idx = 0;

  for (int i = 0; i < n; i++) {
    if (i < k || i > l) {
      new_arr[idx++] = arr[i];
    }
  }
  n = n - (l - k + 1);

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed k element: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_3() {
  std::cout << "3 task.\n\n";

  int n = -1;
  while (!(n >= 2)) {
    std::cout << "Enter the length of array (N >= 2): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];
  int odd_elements_count = 0;

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    if (arr[i] % 2 == 1) {
      odd_elements_count += 1;
    }
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n - odd_elements_count];
  int idx = 0;

  for (int i = 0; i < n; i++) {
    if (arr[i] % 2 == 0) {
      new_arr[idx++] = arr[i];
    }
  }
  n -= odd_elements_count;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed all odd elements: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_4() {
  std::cout << "4 task.\n\n";

  int n = -1;
  while (!(n >= 2)) {
    std::cout << "Enter the length of array (N >= 2): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n / 2];
  int idx = 0;

  for (int i = 1; i < n; i += 2) {
    new_arr[idx++] = arr[i];
  }
  n /= 2;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed even index elements: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_5() {
  std::cout << "5 task.\n\n";

  int n = -1;
  while (!(n >= 2)) {
    std::cout << "Enter the length of array (N >= 2): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  int prev_int = arr[0];
  int new_arr_length = 1;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    if (prev_int != arr[i]) {
      prev_int = arr[i];
      new_arr_length += 1;
    }
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[new_arr_length];
  int idx = 0;

  prev_int = arr[0];
  new_arr[0] = prev_int;
  idx += 1;

  for (int i = 1; i < n; i++) {
    if (prev_int != arr[i]) {
      prev_int = arr[i];
      new_arr[idx++] = arr[i];
    }
  }
  n = new_arr_length;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed similar neighbor elements: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_6() {
  std::cout << "6 task.\n\n";

  int n = -1;
  while (!(n >= 2)) {
    std::cout << "Enter the length of array (N >= 2): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  int min_element_idx = 0;
  int max_element_idx = 0;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    if (arr[min_element_idx] > arr[i]) {
      min_element_idx = i;
    }
    if (arr[max_element_idx] < arr[i]) {
      max_element_idx = i;
    }
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n + 2];
  int idx = 0;

  for (int i = 0; i < n; i++) {
    if (arr[min_element_idx] == arr[i]) {
      new_arr[idx++] = 0;
    }

    new_arr[idx++] = arr[i];

    if (arr[max_element_idx] == arr[i]) {
      new_arr[idx++] = 0;
    }
  }
  n += 2;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we added 0 before the smallest and 0 after the largest "
               "elements: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_7() {
  std::cout << "7 task.\n\n";

  int n = -1;
  while (!(n >= 1)) {
    std::cout << "Enter the length of array (N >= 1): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  int k = 0;
  while (!(1 <= k && k <= n)) {
    std::cout << "Enter Kth element to paste zeros after it (1 <= K <= N): ";
    std::cin >> k;
  }
  k -= 1;
  std::cout << std::endl;

  int m = 0;
  while (!(1 <= m && m <= 10)) {
    std::cout << "Enter the M count of zeros (1 <= M <= 10): ";
    std::cin >> m;
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n + m];
  int idx = 0;

  for (int i = 0; i < n; i++) {
    if (i == k) {
      new_arr[idx++] = arr[i];
      for (int j = 0; j < m; j++) {
        new_arr[idx++] = 0;
      }
    } else {
      new_arr[idx++] = arr[i];
    }
  }
  n += m;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we add zeros after Kth element: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_8() {
  std::cout << "8 task.\n\n";

  int n = -1;
  while (!(n >= 1)) {
    std::cout << "Enter the length of array (N >= 1): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  int curr_series_start = 0;
  int series_count = 0;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    if (arr[curr_series_start] != arr[i]) {
      if (i - curr_series_start >= 2) {
        series_count++;
      }
      curr_series_start = i;
    }
    if (i + 1 == n && i - curr_series_start >= 1) {
      series_count++;
    }
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int *new_arr = new int[n - series_count];
  int idx = 0;

  curr_series_start = 0;

  for (int i = 0; i < n; i++) {
    if (i + 1 < n && arr[i] != arr[i + 1]) {
      if (i - curr_series_start == 0) {
        new_arr[idx++] = arr[i];
      }
      curr_series_start = i + 1;
      continue;
    }
    new_arr[idx++] = arr[i];
  }
  n -= series_count;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we reduced each series to 1 element: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

void solution_9() {
  std::cout << "9 task.\n\n";

  int n = -1;
  while (!(n >= 1)) {
    std::cout << "Enter the length of array (N >= 1): ";
    std::cin >> n;
  }
  std::cout << std::endl;

  int *arr = new int[n];

  std::cout << "Fill in the array with N integers: ";
  for (int i = 0; i < n; i++) {
    std::cin >> arr[i];
  }
  std::cout << std::endl;

  std::cout << "The array before: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;

  int duplicates_count = 0;

  for (int i = 0; i < n; i++) {
    bool is_duplicate = false;
    for (int j = i + 1; j < n; j++) {
      if (arr[i] == arr[j]) {
        is_duplicate = true;
        break;
      }
    }
    if (is_duplicate) {
      duplicates_count += 1;
    }
  }

  int *new_arr = new int[n - duplicates_count];
  int idx = 0;

  for (int i = 0; i < n; i++) {
    bool is_duplicate = false;
    for (int j = 0; j < n; j++) {
      if (arr[i] == new_arr[j]) {
        is_duplicate = true;
        break;
      }
    }
    if (!is_duplicate) {
      new_arr[idx++] = arr[i];
    }
  }
  n -= duplicates_count;

  delete[] arr;
  arr = new_arr;

  std::cout << "After we removed the duplicates: ";
  for (int i = 0; i < n; i++) {
    std::cout << arr[i] << " ";
  }

  delete[] arr;

  std::cout << "\n\n================\n\n";
}

/*===================================*/

int main() {
  std::cout << "Full Name: Kalts Daniil.\n";
  std::cout << "Group: IT2-2404SE.";

  std::cout << "\n\n";

  std::cout << "================";

  std::cout << "\n\n";

  std::cout << "5th laboratory work:";

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

  return 0;
}
