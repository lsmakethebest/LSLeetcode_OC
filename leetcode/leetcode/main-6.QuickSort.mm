//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//


#include <iostream>

#pragma mark - 快速排序

/*i=0;j=9; value=72
 72  6  57  88  60  42  83  73  48  85

开始j--

i=0;j=8; value=72  nums[i]=nums[j];
 48  6  57  88  60  42  83  73  48  85

开始i++

i=3;j=8; value=72 nums[j]=nums[i];
 48  6  57  88  60  42  83  73  88  85

又一次while(i<j)
 开始j--
 
i=3;j=5; value=72 nums[i]=nums[j]
 48  6  57  42  60  42  83  73  88  85
 
 开始i++
 直到 i=j 仍然未发现 nums[i]>value
 i=5;j=5; value=72
 48  6  57  42  60  42  83  73  88  85
 
 结束循环
    nums[low]=curValue;
 48  6  57  42  60  72  83  73  88  85
 
*/

#pragma mark - 快速排序1
int quickSortIn(int nums[],int low,int high){
    int curValue=nums[low];
    while (low<high) {
        while (low<high&&curValue<=nums[high]) {
            high--;
        }
        nums[low]=nums[high];
        while (low<high&&curValue>=nums[low]) {
            low++;
        }
        nums[high]=nums[low];
    }
    nums[low]=curValue;
    return low;
}
void quickSort(int nums[],int low,int high)
{
    if (low<high) {
        int cur=quickSortIn(nums, low, high);
        quickSort(nums, low, cur-1);
        quickSort(nums, cur+1, high);
    }
}

#pragma mark - 快速排序2
void quick_sort(int s[], int l, int r){
    if (l < r){
        //Swap(s[l], s[(l + r) / 2]);
        //将中间的这个数和第一个数交换 参见注1
        int i = l, j = r, x = s[l];
        while (i < j){
            // 从右向左找第一个小于x的数
            while(i < j && s[j] >= x) {
                j--;
            }
            s[i] = s[j];
            // 从左向右找第一个大于等于x的数
            while(i < j && s[i] < x){
                i++;
            }
            s[j] = s[i];
        }
        s[i] = x;
        quick_sort(s, l, i - 1); // 递归调用
        quick_sort(s, i + 1, r);
    }
}

int main()
{
    int nums[]={1,3,5,8,10,7,9,4};
    quick_sort(nums, 0,7);
    for (int i=0; i<8; i++) {
        printf("%d ",nums[i]);
    }
    return 1;
}


