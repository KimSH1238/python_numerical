#define _CRT_SECURE_NO_WARNING
#define _USE_MATH_DEFINES

#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

int main(void)
{
	double radius;
	double area, testarea;

	printf("반지름을 입력하시오 : ");
	scanf_s("%lf", &radius);

	area = M_PI * pow(radius, 2);
	testarea = 3.141592 * pow(radius, 2);

	printf("면적 테스트 : %-8.4lf, %8.4lf\n", area, testarea);

	return 0;
}