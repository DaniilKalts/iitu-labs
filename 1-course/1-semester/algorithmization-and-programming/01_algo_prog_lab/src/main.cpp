#include <iostream>
#include <cmath>     // Mathematical functions

int main()
{
    /* CLASS WORK (Begin): */

    // 1 Task
    /*
    std::cout << "Solution 1:\n\n";

    int a, P;
    std::cout << "Enter a side length (A): ";
    std::cin >> a;
    P = 4 * a;
    std::cout << "The perimeter of the square with side " << a << " is " << P << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 2 Task
    /*
    std::cout << "Solution 2:\n\n";

    int a, S;
    std::cout << "Enter a side length (A): ";
    std::cin >> a;
    S = a * a;
    std::cout << "The area of the square with side " << a << " is " << S << ".\n\n";
    std::cout << "====================\n\n";
    */
    

    // 3 Task
    /*
    std::cout << "Solution 3:\n\n";

    int a, b, P, S;
    std::cout << "Enter side A: ";
    std::cin >> a;
    std::cout << "Enter side B: ";
    std::cin >> b;
    P = (a + b) * 2;
    S = a * b;
    std::cout << "The perimeter of the rectangle is " << P << " and the area is " << S << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 4 Task
    /*
    std::cout << "Solution 4:\n\n";

    float d, PI = 3.14, L;
    std::cout << "Enter the diameter (D): ";
    std::cin >> d;
    L = PI * d;
    std::cout << "The circumference of the circle is " << L << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 5 Task
    /*
    std::cout << "Solution 5:\n\n";

    int a, S, V;
    std::cout << "Enter the side length of the cube (A): ";
    std::cin >> a;
    S = 6 * a * a;
    V = a * a * a;
    std::cout << "The surface area of the cube is " << S << " and the volume is " << V << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 6 Task
    /*
    std::cout << "Solution 6:\n\n";

    int a, b, c, S, V;
    std::cout << "Enter the length (A): ";
    std::cin >> a;
    std::cout << "Enter the width (B): ";
    std::cin >> b;
    std::cout << "Enter the height (C): ";
    std::cin >> c;
    S = 2 * (a * b + b * c + a * c);
    V = a * b * c;
    std::cout << "The surface area of the rectangular prism is " << S << " and the volume is " << V << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 7 Task
    /*
    std::cout << "Solution 7:\n\n";

    float PI = 3.14, R, L, S;
    std::cout << "Enter the radius (R): ";
    std::cin >> R;
    L = 2 * PI * R;
    S = PI * R * R;
    std::cout << "The circumference of the circle is " << L << " and the area is " << S << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 8 Task
    /*
    std::cout << "Solution 8:\n\n";

    int a, b;
    std::cout << "Enter first number (A): ";
    std::cin >> a;
    std::cout << "Enter second number (B): ";
    std::cin >> b;
    std::cout << "The average of the two numbers is " << (a + b) / 2.0 << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 9 Task
    /*
    std::cout << "Solution 9:\n\n";

    int a, b;
    std::cout << "Enter first number (A): ";
    std::cin >> a;
    std::cout << "Enter second number (B): ";
    std::cin >> b;
    std::cout << "The geometric mean of the two numbers is " << std::sqrt(a * b) << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 10 Task
    /*
    std::cout << "Solution 10:\n\n";

    float a, b;
    std::cout << "Enter first number (A): ";
    std::cin >> a;
    std::cout << "Enter second number (B): ";
    std::cin >> b;
    std::cout << "The sum is " << a * a + b * b << ".\n";
    std::cout << "The difference is " << a * a - b * b << ".\n";
    std::cout << "The product is " << (a * a) * (b * b) << ".\n";
    std::cout << "The quotient is " << (a * a) / (b * b) << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 11 Task
    /*
    std::cout << "Solution 11:\n\n";

    float a, b;
    std::cout << "Enter first number (A): ";
    std::cin >> a;
    std::cout << "Enter second number (B): ";
    std::cin >> b;
    std::cout << "The sum of the absolute values is " << std::fabs(a) + std::fabs(b) << ".\n";
    std::cout << "The difference of the absolute values is " << std::fabs(a) - std::fabs(b) << ".\n";
    std::cout << "The product of the absolute values is " << std::fabs(a) * std::fabs(b) << ".\n";
    std::cout << "The quotient of the absolute values is " << std::fabs(a) / std::fabs(b) << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 12 Task
    /*
    std::cout << "Solution 12:\n\n";

    float a, b, C, P;
    std::cout << "Enter the length of side A: ";
    std::cin >> a;
    std::cout << "Enter the length of side B: ";
    std::cin >> b;
    C = std::sqrt(a * a + b * b);
    P = a + b + C;
    std::cout << "The hypotenuse is " << C << " and the perimeter is " << P << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 13 Task
    /*
    std::cout << "Solution 13:\n\n";

    float PI = 3.14, R1, R2, S1, S2, S3;
    std::cout << "Enter the radius R1: ";
    std::cin >> R1;
    std::cout << "Enter the radius R2: ";
    std::cin >> R2;
    S1 = PI * (R1 * R1);
    S2 = PI * (R2 * R2);
    S3 = std::fabs(S1 - S2);
    std::cout << "The area of the larger circle is " << S1 << ".\n";
    std::cout << "The area of the smaller circle is " << S2 << ".\n";
    std::cout << "The area between the two circles is " << S3 << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 14 Task
    /*
    std::cout << "Solution 14:\n\n";

    float PI = 3.14, L, R, S;
    std::cout << "Enter the circumference (L): ";
    std::cin >> L;
    R = L / (2 * PI);
    S = PI * R * R;
    std::cout << "The radius is " << R << " and the area is " << S << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 15 Task
    /*
    std::cout << "Solution 15:\n\n";

    float PI = 3.14, D, S, L;
    std::cout << "Enter the area (S): ";
    std::cin >> S;
    D = std::sqrt(S / PI) * 2;
    L = 2 * PI * (D / 2);
    std::cout << "The diameter is " << D << " and the circumference is " << L << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 16 Task
    /*
    std::cout << "Solution 16:\n\n";

    float x1, x2, S;
    std::cout << "Enter point x1: ";
    std::cin >> x1;
    std::cout << "Enter point x2: ";
    std::cin >> x2;
    S = std::fabs(x2 - x1);
    std::cout << "The distance between the two points is " << S << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 17 Task
    /*
    std::cout << "Solution 17:\n\n";

    float A, B, C;
    std::cout << "Enter point A: ";
    std::cin >> A;
    std::cout << "Enter point B: ";
    std::cin >> B;
    std::cout << "Enter point C: ";
    std::cin >> C;
    float AC = std::fabs(A - C);
    float BC = std::fabs(B - C);
    float sum = AC + BC;
    std::cout << "The distance from A to C is " << AC << ".\n";
    std::cout << "The distance from B to C is " << BC << ".\n";
    std::cout << "The sum of the distances is " << sum << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 18 Task
    /*
    std::cout << "Solution 18:\n\n";

    float A, B, C;
    std::cout << "Enter point A: ";
    std::cin >> A;
    std::cout << "Enter point B: ";
    std::cin >> B;
    C = std::fabs(B - A) / 2;
    float AC = std::fabs(A - C);
    float BC = std::fabs(B - C);
    float product = AC * BC;
    std::cout << "The distance from A to C is " << AC << ".\n";
    std::cout << "The distance from B to C is " << BC << ".\n";
    std::cout << "The product of the distances is " << product << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 19 Task
    /*
    std::cout << "Solution 19:\n\n";

    float x1, y1, x2, y2;
    std::cout << "Enter the coordinates (x1, y1): ";
    std::cin >> x1 >> y1;
    std::cout << "Enter the coordinates (x2, y2): ";
    std::cin >> x2 >> y2;
    float length = std::fabs(x2 - x1);
    float width = std::fabs(y2 - y1);
    float perimeter = 2 * (length + width);
    float area = length * width;
    std::cout << "The perimeter is " << perimeter << " and the area is " << area << ".\n\n";
    std::cout << "====================\n\n";
    */

    // 20 Task
    /*
    std::cout << "Solution 20:\n\n";

    float x1, y1, x2, y2;
    std::cout << "Enter the coordinates (x1, y1): ";
    std::cin >> x1 >> y1;
    std::cout << "Enter the coordinates (x2, y2): ";
    std::cin >> x2 >> y2;
    float distance = std::sqrt(std::pow(x2 - x1, 2) + std::pow(y2 - y1, 2));
    std::cout << "The distance between the two points is " << distance << ".\n\n";
    std::cout << "====================\n\n";
    */

    /* HOME WORK (Integer): */

    // 6 Task
    /*
    std::cout << "Solution 6:\n\n";

    int num;
    std::cout << "Enter a two-digit number: ";
    std::cin >> num;

    std::cout << "Left digit: " << num / 10 << "\n";
    std::cout << "Right digit: " << num % 10 << "\n\n";

    std::cout << "====================\n\n";
    */

    // 7 Task
    /*
    std::cout << "Solution 7:\n\n";

    int num;
    std::cout << "Enter a two-digit number: ";
    std::cin >> num;

    std::cout << "Sum of digits: " << num / 10 + num % 10 << "\n";
    std::cout << "Product of digits: " << (num / 10) * (num % 10) << "\n\n";

    std::cout << "====================\n\n";
    */

    // 8 Task
    /*
    std::cout << "Solution 8:\n\n";

    int num;
    std::cout << "Enter a two-digit number: ";
    std::cin >> num;

    int reversed_num = (num % 10) * 10 + num / 10;
    std::cout << "Reversed number: " << reversed_num << "\n\n";

    std::cout << "====================\n\n";
    */

    // 9 Task
    /*
    std::cout << "Solution 9:\n\n";

    int num;
    std::cout << "Enter a three-digit number: ";
    std::cin >> num;

    std::cout << "First digit: " << num / 100 << "\n\n";

    std::cout << "====================\n\n";
    */

    // 10 Task
    /*
    std::cout << "Solution 10:\n\n";

    int num;
    std::cout << "Enter a three-digit number: ";
    std::cin >> num;

    std::cout << "Last digit: " << num % 10 << "\n";
    std::cout << "Middle digit: " << num / 10 % 10 << "\n\n";

    std::cout << "====================\n\n";
    */

    // 15 Task
    /*
    std::cout << "Solution 15:\n\n";

    int num;
    std::cout << "Enter a three-digit number: ";
    std::cin >> num;

    int rearranged_num = (num / 10 % 10) * 100 + (num / 100) * 10 + (num % 10);
    std::cout << "After rearranging: " << rearranged_num << "\n\n";

    std::cout << "====================\n\n";
    */

    // 16 Task
    /*
    std::cout << "Solution 16:\n\n";

    int num;
    std::cout << "Enter a three-digit number: ";
    std::cin >> num;

    int rearranged_num = num - (num % 100) + (num % 10) * 10 + (num / 10 % 10);
    std::cout << "After rearranging: " << rearranged_num << "\n\n";

    std::cout << "====================\n\n";
    */

    // 17 Task
    /*
    std::cout << "Solution 17:\n\n";

    int num;
    std::cout << "Enter a three-digit number: ";
    std::cin >> num;

    std::cout << "Hundreds place: " << num / 100 % 10 << "\n\n";

    std::cout << "====================\n\n";
    */

    // 18 Task
    /*
    std::cout << "Solution 18:\n\n";

    int num;
    std::cout << "Enter a four-digit number: ";
    std::cin >> num;

    std::cout << "Thousands place: " << num / 1000 % 10 << "\n\n";

    std::cout << "====================\n\n";
    */

    // 19 Task
    /*
    std::cout << "Solution 19:\n\n";

    int N;
    std::cout << "Enter minutes since start of the day: ";
    std::cin >> N;

    std::cout << N / 60 << " hour(s) and " << N % 60 << " minute(s) passed.\n\n";

    std::cout << "====================\n\n";
    */

    // 20 Task
    /*
    std::cout << "Solution 20:\n\n";

    int N;
    std::cout << "Enter seconds since start of the day: ";
    std::cin >> N;

    std::cout << N / 3600 << " hour(s) passed.\n\n";

    std::cout << "====================\n\n";
    */
}
