//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//

#include <iostream>

#pragma mark - 打印螺旋矩阵（递归解法)

void printMatrix(int **matrix, int x, int y, int width, int height)
{
    int maxW=x+width;
    int maxH=y+height;
    if (width<= 0)
        return;
    if (width == 1||height==1) {
        return;
    }
    
    printf("\n");
    for (int i=x; i<maxW; i++) {
        printf("%d ",matrix[x][i]);
    }
    printf("\n");
    for (int i=y+1; i<maxH-1; i++) {
        printf("%d ",matrix[i][maxW-1]);
    }
    printf("\n");
    for (int i=maxH-1; i>=x; i--) {
        printf("%d ",matrix[maxH-1][i]);
    }
    printf("\n");
    for (int i=maxH-1-1; i>y; i--) {
        printf("%d ",matrix[i][y]);
    }
    printf("\n一轮结束-----------------\n");
    printMatrix(matrix, x+1, y+1, width-2, height-2);

    
}

int main()
{
    int n;
    int **matrix;//螺旋矩阵（二维数组）
    printf("Please input n: ");
    scanf("%d", &n);
    matrix = (int **)malloc(n * sizeof(int *));//为矩阵分配空间
    for (int i = 0; i<n; i++)
        matrix[i] = (int *)malloc(n * sizeof(int));
 
    int start=1;
    for(int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++){
            matrix[i][j]=start;
            start++;
        }
    }
    
    
    //打印螺旋矩阵
    for(int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++){
            printf("%4d", matrix[i][j]);
        }
        printf("\n");
    }
    printf("-----------------------\n");
    printMatrix(matrix, 0, 0, n, n);
    return 1;
}





