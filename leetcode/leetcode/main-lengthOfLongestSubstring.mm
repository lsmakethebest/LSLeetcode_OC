//
//  main.m
//  leetcode
//
//  Created by liusong on 2018/12/18.
//  Copyright © 2018年 liusong. All rights reserved.
//


#include <stack>
#include <iostream>
#include <string>
#include <vector>
#include <map>
using namespace std;

#pragma mark - 最长无重复子串

class Solution {
public:
    int lengthOfLongestSubstring(string str)
    {
        map<char, int> m;
        int length=0;
        int start = 0;
        for(int i = 0; i < str.length(); i++){
            char c = str[i];
            if (m.count(c)&&m[c] >=start){
                start = m[c] + 1;
                m[c] = i;
            }else{
                m[c] = i;
                length = max(length, i - start + 1);
            }
        }
        return length;
    }
};

int main()
{
    Solution so=Solution();
   cout<<so.lengthOfLongestSubstring("abca")<<endl;

    return 0;
}



