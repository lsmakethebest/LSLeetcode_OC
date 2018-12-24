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

#pragma mark - 栈实现队列

class Queue {
public:
    stack<int> s1;
    stack<int> s2;
    void push(int  data)
    {
        s1.push(data);
    }
    void pop()
    {
        if (s1.empty() && s2.empty())     {
                cout << "The queue is empty";
            }
        if (!s2.empty())
        {
            s2.pop();
        }
        else
        {
            while (!s1.empty())
            {
                s2.push(s1.top());
                s1.pop();
            }
            s2.pop();
        }
    }
    int  front()
    {
        assert(!(s1.empty()&&s2.empty()));
        if (s2.empty())
        {
            while (!s1.empty())
            {
                s2.push(s1.top());
                s1.pop();
            }
        }
        return s2.top();
    }
    int back()
    {
        assert(!(s1.empty()&&s2.empty()));
        if (s1.empty() )
        {
            while (!s2.empty())
            {
                s1.push(s2.top());
                s2.pop();
            }
        }
        return s1.top();
    }
    size_t size()
    {
        return s1.size() + s2.size();
    }
    bool empty()
    {
        if (s1.empty() && s2.empty())
        {
            return true;
        }
        return false;
    }

};

int main()
{
    Queue queue=Queue();
    queue.push(1);
    queue.push(2);
    queue.push(3);
    queue.push(4);
    queue.pop();
    queue.push(5);
    queue.push(6);   //此时 s1  6     s2
                     //        5      2
                     //               3
                     //               4
    int v=queue.front();

    return 0;
}



