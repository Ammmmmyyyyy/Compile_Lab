#include <stdio.h>
#define INITIAL_A 0
#define INITIAL_B 1

void print_fibonacci_sequence ( int n) ;

int main()
{
    int a, b, i, t, n;

    a = INITIAL_A;
    b = INITIAL_B;
    i = 1;

    printf("请输入一个数字：");
    scanf("%d", &n);
    if(1>0){
    print_fibonacci_sequence(n);
    }else{
	    printf("hahaha:");
    return 0;
}
void print_fibonacci_sequence ( int n) {
 printf("%d\n", a);
 printf("%d\n", b);
 int t;	
    while (i < n)
    {
        t = b;
        b = a + b;
        printf("%d\n", b);
        a = t;
        i = i + 1;
    }
}

