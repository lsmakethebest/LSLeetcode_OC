//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//

#include <map>
#include <vector>
#include <iostream>

#pragma mark - 两数之和


using namespace std;

vector<int> twoSum(vector<int>& nums, int target) {
    map<int, int> m;
    for (int i = 0; i < nums.size(); ++i) {
        if (m.count(nums[i])) {
            return {m[nums[i]],i};
        }
        m[target-nums[i]] = i;
    }
    return {};
}

int main()
{
    vector<int>obj;//创建一个向量存储容器 int
    // 1 4 9 16 25 36 。。。
    for(int i=1;i<11;i++) // push_back(elem)在数组最后添加数据
   {
        obj.push_back(i*i);
    }
    vector<int> newVec=twoSum(obj, 52);
    for (int i=0; i<newVec.size(); i++) {
        cout<<newVec[i]<<endl;
    }
}

/* python实现
 def twoSum(self, nums, target):
 d={}
 for i in range(0,len(nums)):
   x = nums[i]
   if x in d:
     return d[x],i
   else:
    d[target-x]=i
 
 */



