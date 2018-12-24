//
//  main.m
//  leetcode
//
//  Created by liusong on 2018/12/18.
//  Copyright © 2018年 liusong. All rights reserved.
//


#include <vector>
#include <iostream>

using namespace std;

#pragma mark - 合并另个有序数组

#pragma mark -  解法一
//class Solution {
//public:
//    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
//        int num[m+n];
//        int i=0,j=0,k=0;
//        while (i<m&&j<n) {
//            if (nums1[i]<nums2[j]) {
//                num[k++]=nums1[i++];
//            }else{
//                num[k++]=nums2[j++];
//            }
//        }
//        while (i<m) {
//            num[k++]=nums1[i++];
//        }
//        while (j<n) {
//            num[k++]=nums2[j++];
//        }
//        copy(num,num+m+n,nums1.begin());
//    }
//};

#pragma mark - 解法二使用 vector
//class Solution {
//public:
//    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
//        vector<int> num(m+n);//与解法一类似，不过是新建一个vector
//        int i = 0,j = 0,k = 0;
//        while(i<m && j<n){
//            if(nums1[i] <= nums2[j])
//                num[k++] = nums1[i++];
//            else{
//                num[k++] = nums2[j++];
//            }
//        }
//        while(i < m) num[k++] = nums1[i++];
//        while(j < n) num[k++] = nums2[j++];
//        nums1.assign(num.begin(),num.end());//从哪 到哪 赋值，会将nums1原来的值清空
//    }
//};



/* 当两个nums地址相离很近的时候，容易导致地址产生碰撞，导致对nums[k-1]赋值的时候更改了nums2的值，
   导致结果不一致
 
 num1下标地址
0x100414650  1
0x100414654  2
0x100414658  3
 
 num2下标地址
0x100414660  1
0x100414664  5
0x100414668  6
*/
 
#pragma mark - 第三种解法，不新建数组，直接操作nums1
class Solution {
public:
    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
        int k=m+n;
        while(m>0 && n>0){
            if(nums1[m-1]>=nums2[n-1]){
                nums1[k-1] = nums1[m-1];
                k--;
                m--;
            }
            else{
                nums1[k-1] = nums2[n-1];
                k--;
                n--;
            }
        }
        while(n > 0){
            nums1[k-1] = nums2[n-1];
            k--;
            n--;
        }
    }
};


int main()
{    
/*
    输入:
    nums1 = [1,2,3,0,0,0], m = 3
    nums2 = [2,5,6],       n = 3
    
    输出: [1,2,2,3,5,6]
*/
    Solution so=Solution();
    vector<int> nums1;
    nums1.push_back(1);
    nums1.push_back(2);
    nums1.push_back(3);
    //必须push0，否则容易导致地址碰撞，导致结果和预期结果不一致
    nums1.push_back(0);
    nums1.push_back(0);
    nums1.push_back(0);
    
    
    vector<int> nums2;
    nums2.push_back(1);
    nums2.push_back(5);
    nums2.push_back(6);
    so.merge(nums1, 3, nums2, 3);
    
    //第一,三种解法打印 不能使用 nums1.size() ，因为nums1.size()并没有改变
    for (int i=0; i<6; i++) {
        cout<<nums1[i]<<endl;
    }
    
    //第二种解法可以这样打印使用 nums1.size() 个数
//    for (int i=0; i<nums1.size(); i++) {
//        cout<<nums1[i]<<endl;
//    }
    

    return 0;
}



