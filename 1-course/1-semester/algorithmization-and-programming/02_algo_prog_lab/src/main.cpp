#include <iostream>
#include <cmath>      // Mathematical functions
#include <algorithm>  // Utility functions like std::max

/* ========= Utility Functions: ========= */

// print_move_result (13 task) - returns a word for a unit.
std::string one_digit_to_name(int num) {
    switch (num % 10) {
    case 1: return "one";
    case 2: return "two";
    case 3: return "three";
    case 4: return "four";
    case 5: return "five";
    case 6: return "six";
    case 7: return "seven";
    case 8: return "eight";
    case 9: return "nine";
    default: return "";
    }
}

// print_move_result (13 task) - returns a word for teens.
std::string teens_to_name(int num) {
    switch (num % 100) {
    case 10: return "ten";
    case 11: return "eleven";
    case 12: return "twelve";
    case 13: return "thirteen";
    case 14: return "fourteen";
    case 15: return "fifteen";
    case 16: return "sixteen";
    case 17: return "seventeen";
    case 18: return "eighteen";
    case 19: return "nineteen";
    default: return "";
    }
}

// print_move_result (13 task) - returns a word for tens.
std::string two_digit_to_name(int num) {
    switch (num / 10) {
    case 2: return "twenty";
    case 3: return "thirty";
    case 4: return "forty";
    case 5: return "fifty";
    case 6: return "sixty";
    case 7: return "seventy";
    case 8: return "eighty";
    case 9: return "ninety";
    default: return "";
    }
}

// print_move_result (18 task) - prints a message if a piece can move from one coordinate to another.
void print_move_result(const std::string& piece, bool can_move, int x1, int y1, int x2, int y2) {
    std::cout << "The " << piece
        << (can_move ? " can " : " can't ")
        << "move from (" << x1 << ", " << y1 << ") "
        << "to (" << x2 << ", " << y2 << ")." << std::endl;
}

/* ============================== */

/* ========= Solutions: ========= */

void solution_1() {
    std::cout << "Solution 1:\n\n";

    int a;

    std::cout << "Enter an integer A: ";
    std::cin >> a;

    std::cout << "\n";

    std::cout << "The integer " << a << " is " << (a % 2 == 0 ? "not " : "") << "an odd number.\n\n";
    std::cout << "====================\n\n";
}

void solution_2() {
    std::cout << "Solution 2:\n\n";

    int a, b;

    std::cout << "Enter an integer A: ";
    std::cin >> a;
    std::cout << "Enter an integer B: ";
    std::cin >> b;

    std::cout << "\n";

    std::cout << "Integers: " << a << " and " << b << ((a + b) % 2 != 0 ? " don't " : " ") << "have the same parity.\n\n";
    std::cout << "====================\n\n";
}

void solution_3() {
    std::cout << "Solution 3:\n\n";

    int integer;

    std::cout << "Enter a positive integer: ";
    std::cin >> integer;

    bool is_positive_three_digit_odd =
        (integer >= 100 && integer <= 999)
        && (integer % 2 == 1);

    std::cout << "\n";
    
    std::cout << "The integer: " << integer << " is " << (!is_positive_three_digit_odd ? "not " : "") << "a positive-three-digit-odd number.\n\n";

    std::cout << "====================\n\n";
}

void solution_4() {
    std::cout << "Solution 4:\n\n";

    int integer1, integer2, integer3;

    std::cout << "Enter an integer 1: ";
    std::cin >> integer1;
    std::cout << "Enter an integer 2: ";
    std::cin >> integer2;
    std::cout << "Enter an integer 3: ";
    std::cin >> integer3;

    std::cout << "\n";

    std::cout << "There is" << ((integer1 == integer2 || integer1 == integer3 || integer2 == integer3) ? " a pair " : " no pair ") << "of equal integers.\n\n";

    std::cout << "====================\n\n";
}

void solution_5() {
    std::cout << "Solution 5:\n\n";\

    int integer;

    std::cout << "Enter a three-digit integer to get information about it: ";
    std::cin >> integer;

    std::cout << "\n";

    if (integer / 100 == 0 || integer / 100 > 9) {
        std::cout << "Error: The number: " << integer << " is not three digits.\n\n";
    }
    else {
        int hundreds = integer / 100;
        int tens = integer / 10 % 10;
        int ones = integer % 10;
        if (hundreds != tens && tens != ones && hundreds != ones) {
            std::cout << "All digits of the " << integer << " are different.\n\n";
        }
        else {
            std::cout << "There are some similar digits in the integer " << integer << ".\n\n";
        }
    }

    std::cout << "====================\n\n";
}

void solution_6() {
    std::cout << "Solution 6:\n\n";

    int x, y;

    std::cout << "Enter coordinates of the point (x, y): ";
    std::cin >> x >> y;

    std::cout << "\n";

    if (x == 0 || y == 0) {
        std::cout << "The point (" << x << ", " << y << ") lies on an axis and does not belong to any quarter.\n\n";
    }
    else if (x < 0 && y > 0) {
        std::cout << "The point (" << x << ", " << y << ") is in the 2nd quarter.\n\n";
    }
    else if (x < 0 && y < 0) {
        std::cout << "The point (" << x << ", " << y << ") is in the 3rd quarter.\n\n";
    }
    else {
        std::cout << "The point (" << x << ", " << y << ") is not in the 2nd or 3rd quarter.\n\n";
    }

    std::cout << "====================\n\n";
}

void solution_7() {
    std::cout << "Solution 7:\n\n";

    int a, b, c;

    std::cout << "Enter a side of a triangle A: ";
    std::cin >> a;
    std::cout << "Enter a side of a triangle B: ";
    std::cin >> b;
    std::cout << "Enter a side of a triangle C: ";
    std::cin >> c;

    bool does_exist_triangle = (a + b > c) && (a + c > b) && (b + c > a);

    std::cout << "\n";

    std::cout << "The triangle with these sides" << (!does_exist_triangle ? " not " : " ") << "exists.\n\n";

    std::cout << "====================\n\n";
}

void solution_8() {
    std::cout << "Solution 8:\n\n";

    int integer1, integer2, integer3;

    std::cout << "Enter an integer 1: ";
    std::cin >> integer1;
    std::cout << "Enter an integer 2: ";
    std::cin >> integer2;
    std::cout << "Enter an integer 3: ";
    std::cin >> integer3;

    int largest = std::max({ integer1, integer2, integer3 });
    int second_largest;

    if (largest == integer1) {
        second_largest = std::max(integer2, integer3);
    }
    else if (largest == integer2) {
        second_largest = std::max(integer1, integer3);
    }
    else {
        second_largest = std::max(integer1, integer2);
    }

    std::cout << "\n";

    std::cout << "The sum of " << largest << " and " << second_largest << " is " << largest + second_largest << ".\n\n";

    std::cout << "====================\n\n";
}

void solution_9() {
    std::cout << "Solution 9:\n\n";

    int a, b, c;

    std::cout << "Enter a point A on a number line: ";
    std::cin >> a;
    std::cout << "Enter a point B on a number line: ";
    std::cin >> b;
    std::cout << "Enter a point C on a number line: ";
    std::cin >> c;

    std::cout << "\n";

    int distanceAB = std::abs(a - b);
    int distanceAC = std::abs(a - c);

    if (distanceAB < distanceAC) {
        std::cout << "Point B (" << b << ") is closer to A (" << a << ") with a distance of " << distanceAB << ".\n\n";
    }
    else if (distanceAC < distanceAB) {
        std::cout << "Point C (" << c << ") is closer to A (" << a << ") with a distance of " << distanceAC << ".\n\n";
    }
    else {
        std::cout << "Both points are at the same distance " << distanceAB << ".\n\n";
    }

    std::cout << "====================\n\n";
}

void solution_10() {
    std::cout << "Solution 10:\n\n";

    int integer;

    std::cout << "Enter an integer to get information about it: ";
    std::cin >> integer;

    std::cout << "\n";

    if (integer == 0) {
        std::cout << "The integer " << integer << " is zero.\n\n";
    }
    else {
        std::cout << "The integer " << integer << " is a "
            << (integer < 0 ? "negative" : "positive")
            << ((integer % 2 == 0) ? " even " : " odd ")
            << "number.\n\n";
    }

    std::cout << "====================\n\n";
}

void solution_11() {
    std::cout << "Solution 11:\n\n";

    int K;
    std::cout << "Enter an integer K (1-5) to get the grade description: ";
    std::cin >> K;

    std::cout << "\n";

    switch (K) {
    case 1:
        std::cout << "The grade 1 is poor.\n\n";
        break;
    case 2:
        std::cout << "The grade 2 is unsatisfactory.\n\n";
        break;
    case 3:
        std::cout << "The grade 3 is satisfactory.\n\n";
        break;
    case 4:
        std::cout << "The grade 4 is good.\n\n";
        break;
    case 5:
        std::cout << "The grade 5 is excellent.\n\n";
        break;
    default:
        std::cout << "There is no grade " << K << ".\n\n";
    }

    std::cout << "====================\n\n";
}

void solution_12() {
    std::cout << "Solution 12:\n\n";

    int n;
    double a, b;

    std::cout << "Enter an integer n (1-addition, 2-subtraction, 3-multiplication, 4-division): ";
    std::cin >> n;
    std::cout << "Enter an integer A: ";
    std::cin >> a;
    std::cout << "Enter an integer B: ";
    std::cin >> b;

    std::cout << "\n";

    if (n == 4 && b == 0) {
        std::cout << "Error: Division by zero is not allowed.\n\n";
    }
    else {
        switch (n) {
        case 1:
            std::cout << "The sum of " << a << " and " << b << " equals " << a + b << ".\n\n";
            break;
        case 2:
            std::cout << "The difference between " << a << " and " << b << " equals " << a - b << ".\n\n";
            break;
        case 3:
            std::cout << "The product of " << a << " and " << b << " equals " << a * b << ".\n\n";
            break;
        case 4:
            std::cout << "The quotient of " << a << " divided by " << b << " equals " << a / b << ".\n\n";
            break;
        default:
            std::cout << "Error: Invalid operation number.\n\n";
        }
    }

    std::cout << "====================\n\n";
}

void solution_13() {
    std::cout << "Solution 13:\n\n";

    int integer;
    std::cout << "Enter a three-digit integer: ";
    std::cin >> integer;

    std::cout << "\n";

    if (integer < 100 || integer > 999) {
        std::cout << "The number: " << integer << " is not three digits.\n\n";
    }
    else {
        std::cout << "The number " << integer << " is spelled as " << one_digit_to_name(integer / 100) << " hundred ";

        int last_two_digits = integer % 100;

        if (last_two_digits >= 10 && last_two_digits <= 19) {
            std::cout << teens_to_name(last_two_digits) << ".\n\n";
        }
        else {
            std::string tens = two_digit_to_name(last_two_digits);
            std::string ones = one_digit_to_name(last_two_digits);

            if (!tens.empty()) {
                std::cout << tens << " ";
            }
            if (!ones.empty()) {
                std::cout << ones;
            }
            std::cout << ".\n\n";
        }
    }

    std::cout << "====================\n\n";
}

void solution_14() {
    std::cout << "Solution 14:\n\n";

    int integer;
    std::cout << "Enter an integer in the range (1-999) to get information about it: ";
    std::cin >> integer;

    std::cout << "\n";

    if (integer < 1 || integer > 999) {
        std::cout << "Error: The number is not in the range (1-999).\n\n";
    }
    else {
        std::cout << "The integer " << integer << " is an " << ((integer % 2 == 0) ? "even " : "odd ");

        if (integer / 10 == 0) {
            std::cout << "one-digit number.\n\n";
        }
        else if (integer / 10 <= 9) {
            std::cout << "two-digit number.\n\n";
        }
        else {
            std::cout << "three-digit number.\n\n";
        }
    }

    std::cout << "====================\n\n";
}

void solution_15() {
    std::cout << "Solution 15:\n\n";

    int x, y;
    std::cout << "Enter coordinates X and Y: ";
    std::cin >> x >> y;

    std::cout << "\n";

    if (x == 0 && y == 0) {
        std::cout << "The point (" << x << ", " << y << ") is at the origin.\n\n";
    }
    else if (x == 0) {
        std::cout << "The point (" << x << ", " << y << ") lies on the Y-axis.\n\n";
    }
    else if (y == 0) {
        std::cout << "The point (" << x << ", " << y << ") lies on the X-axis.\n\n";
    }
    else {
        if (x > 0 && y > 0) {
            std::cout << "The point (" << x << ", " << y << ") is in the Quadrant 1.\n\n";
        }
        else if (x < 0 && y > 0) {
            std::cout << "The point (" << x << ", " << y << ") is in the Quadrant 2.\n\n";
        }
        else if (x < 0 && y < 0) {
            std::cout << "The point (" << x << ", " << y << ") is in the Quadrant 3.\n\n";
        }
        else if (x > 0 && y < 0) {
            std::cout << "The point (" << x << ", " << y << ") is in the Quadrant 4.\n\n";
        }
    }

    std::cout << "====================\n\n";
}

void solution_16() {
    std::cout << "Solution 16:\n\n";

    int x1, y1, x2, y2;

    std::cout << "Enter coordinates of the first square (x1, y1): ";
    std::cin >> x1 >> y1;

    std::cout << "Enter coordinates of the second square (x2, y2): ";
    std::cin >> x2 >> y2;

    std::cout << "\n";

    if ((x1 + y1) % 2 == (x2 + y2) % 2) {
        std::cout << "The squares (" << x1 << ", " << y1 << ") and (" << x2 << ", " << y2 << ") have the same color.\n\n";
    }
    else {
        std::cout << "The squares (" << x1 << ", " << y1 << ") and (" << x2 << ", " << y2 << ") have different colors.\n\n";
    }

    std::cout << "====================\n\n";
}

void solution_17() {
    std::cout << "Solution 17:\n\n";

    int month, year;

    std::cout << "Enter month number (1-12): ";
    std::cin >> month;

    std::cout << "Enter year number: ";
    std::cin >> year;

    std::cout << "\n";

    switch (month) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
        std::cout << "The month has 31 days.\n\n";
        break;
    case 4: case 6: case 9: case 11:
        std::cout << "The month has 30 days.\n\n";
        break;
    case 2:
        std::cout << "The month has "
            << ((year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? "29 days (leap year)" : "28 days")
            << ".\n\n";
        break;
    default:
        std::cout << "Invalid month number.\n\n";
        break;
    }

    std::cout << "====================\n\n";
}

void solution_18() {
    std::cout << "Solution 18:\n\n";

    int x1, y1, x2, y2;

    std::cout << "Enter coordinates of the first square (x1, y1): ";
    std::cin >> x1 >> y1;

    std::cout << "Enter coordinates of the second square (x2, y2): ";
    std::cin >> x2 >> y2;

    std::cout << "\n";

    // Rook
    bool can_move_rook = (x1 == x2 || y1 == y2);
    print_move_result("rook", can_move_rook, x1, y1, x2, y2);

    // King
    bool can_move_king = (std::abs(x1 - x2) <= 1 && std::abs(y1 - y2) <= 1);
    print_move_result("king", can_move_king, x1, y1, x2, y2);

    // Bishop
    bool can_move_bishop = (std::abs(x1 - x2) == std::abs(y1 - y2));
    print_move_result("bishop", can_move_bishop, x1, y1, x2, y2);

    // Queen
    bool can_move_queen = can_move_rook || can_move_bishop;
    print_move_result("queen", can_move_queen, x1, y1, x2, y2);

    // Knight
    bool can_move_knight =
        (std::abs(x1 - x2) == 2 && std::abs(y1 - y2) == 1) ||
        (std::abs(x1 - x2) == 1 && std::abs(y1 - y2) == 2);
    print_move_result("knight", can_move_knight, x1, y1, x2, y2);

    std::cout << "\n";

    std::cout << "====================\n\n";
}

/* ============================== */

int main() {
    //// 1 Task
    //solution_1();

    //// 2 Task
    //solution_2();

    //// 3 Task
    //solution_3();

    //// 4 Task
    //solution_4();

    //// 5 Task
    //solution_5();

    //// 6 Task
    //solution_6();

    //// 7 Task
    //solution_7();

    //// 8 Task
    //solution_8();

    //// 9 Task
    //solution_9();

    //// 10 Task
    //solution_10();

    //// 11 Task
    //solution_11();

    //// 12 Task
    //solution_12();

    //// 13 Task
    //solution_13();

    //// 14 Task
    //solution_14();

    //// 15 Task
    //solution_15();

    //// 16 Task
    //solution_16();

    // 17 Task
    //solution_17();

    //// 18 Task
    //solution_18();
}
