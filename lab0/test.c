#include <stdio.h>
#include <stdlib.h> 

int sum_array(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum;
}

int main()
{
    int *a;
    int n;
    printf("请输入一个数字：");
    scanf("%d", &n);
    a = (int *)malloc(n);
    for(int i=0;i<n;i++)
    {
        a[i]=i;
    }
    int sum = sum_array(a,n);
    printf("%d\n", sum);
}