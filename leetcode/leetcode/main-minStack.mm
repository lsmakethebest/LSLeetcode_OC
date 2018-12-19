//
//  main.m
//  leetcode
//
//  Created by liusong on 2018/12/18.
//  Copyright © 2018年 liusong. All rights reserved.
//


#include <stack>
#include <iostream>

using namespace std;


#pragma mark - 最小栈


#pragma mark - 解法一 需要2个stack

//class MinStack
//{
//public:
//    stack<int> s1;//真正存放数据的栈
//    stack<int> s2;//存放较小数的栈  比如 5 5 4 3 2 1
//public:
//    MinStack() {
//    }
//
//    void push(int x) {
//        s1.push(x);
//        if (s2.empty()||x<=s2.top()) {
//            s2.push(x);
//        }
//    }
//
//    void pop() {
//        if (s1.top()==s2.top()) {
//            s2.pop();
//        }
//        s1.pop();
//    }
//
//    int top() {
//        return s1.top();
//    }
//
//    int getMin() {
//        return s2.top();
//    }
//
//};

#pragma mark - 解法二 只需要一个stack和一个 int minValue;
class MinStack
{
public:
    stack<int> s;
    int minValue;
public:
    MinStack() {
        minValue=INT_MAX;
    }
    
    void push(int x) {
        if (x<=minValue) {
            s.push(minValue);
            minValue=x;
        }
        s.push(x);
    }
    
    void pop() {
        int v=s.top();
        s.pop();
        if (v==minValue) {
            minValue=s.top();
            s.pop();
        }
    }
    
    int top() {
        return s.top();
    }
    
    int getMin() {
        return minValue;
    }
    
};

int main(int argc, const char * argv[]) {
    MinStack minStack = MinStack();
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    cout<<minStack.getMin()<<endl;   //--> 返回 -3.
    minStack.pop();
    cout<<minStack.top()<<endl;      //--> 返回 0.
    cout<<minStack.getMin()<<endl;  // --> 返回 -2.

    return 0;
}



