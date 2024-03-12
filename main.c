#include <stdio.h>
#include "mylib.h"
#include "calculator.h"

int main() {
    double result;

    // Using functions from mylib
    result = plus(2, 3);
    printf("plus(2, 3) = %.2f\n", result);

    result = minus(10, 6);
    printf("minus(10, 6) = %.2f\n", result);

    // Using functions from calculator
    result = kefel(6, 3);
    printf("kefel(6, 3) = %.2f\n", result);

    result = hiluk(10, 5);
    printf("hiluk(10, 4) = %.2f\n", result);

    return 0;
}
