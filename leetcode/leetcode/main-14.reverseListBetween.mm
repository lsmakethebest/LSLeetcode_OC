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

#pragma mark - 翻转链表 m,n 

struct ListNode
{
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(NULL) {}
};

class Solution
{
public:
    ListNode* reverseBetween(struct ListNode* head, int m, int n) {
        if(head == NULL || n - m <= 0)
            return head;
        struct ListNode* cur = head;
        struct ListNode* end = cur;
        struct ListNode* prev = NULL;
        struct ListNode* next = NULL;
        struct ListNode* start = cur;
        int i = 1;
        for(; i < m ; ++i)
        {
            start = cur;//保存1号结点
            cur = cur->next;
            end = cur;//保存2号结点
        }
        for(i = 0; i <= n - m ; ++i)
        {
            next = cur->next;
            cur->next = prev;
            prev = cur;
            cur = next;
        }//实现2->4 3个结点的逆置，此时2的next指向空，cur和next都指向了 5，prev指向的是 4
        start->next = prev;//1 的next指向 4
        end->next = cur;//2 的next指向 5
        if(m == 1)
            return prev;//如果头结点也参与了逆置，那么新的头结点是逆置链表中的最后一个结点，也就是 4 结点
        return head;
    }
};

void printNode(ListNode *root){
    
    ListNode *node=root;
    while (node!=NULL) {
        printf("%d\n",node->val);
        node=node->next;
    }
}

int main(int argc, const char * argv[]) {
    
//    输入: 1->2->3->4->5->NULL
//    输出: 5->4->3->2->1->NULL
    ListNode *node1=new ListNode(1);
    ListNode *node2=new ListNode(2);
    ListNode *node3=new ListNode(3);
    ListNode *node4=new ListNode(4);
    ListNode *node5=new ListNode(5);
    node1->next=node2;
    node2->next=node3;
    node3->next=node4;
    node4->next=node5;
    Solution so=Solution();
    ListNode *newHead=so.reverseBetween(node1, 2, 4);
    printNode(newHead);

    return 0;
}



