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

#pragma mark - 两个链表相加

struct ListNode
{
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode *dummyHead = new ListNode(0);
        ListNode *p=l1;
        ListNode *q=l2;
        ListNode *curr=dummyHead;
        int carry = 0;
        while (p != NULL || q != NULL)
        {
            int x = (p != NULL) ? p->val : 0;
            int y = (q != NULL) ? q->val : 0;
            int sum = carry + x + y;
            carry = sum / 10;
            curr->next = new ListNode(sum % 10);
            curr = curr->next;
            if (p != NULL) p = p->next;
            if (q != NULL) q = q->next;
        }
        if (carry > 0) {
            curr->next = new ListNode(carry);
        }
        return dummyHead->next;
    }
};

void printNode(ListNode *root){
    
    ListNode *node=root;
    while (node!=NULL) {
        printf("%d\n",node->val);
        node=node->next;
    }
}

int main() {
    //   564+857=1421
    // 4 6 5  +  7 5 8 = 1241
    ListNode *node1=new ListNode(4);
    ListNode *node2=new ListNode(6);
    ListNode *node3=new ListNode(5);
    node1->next=node2;
    node2->next=node3;
    
    
    ListNode *node4=new ListNode(7);
    ListNode *node5=new ListNode(5);
    ListNode *node6=new ListNode(8);
    node4->next=node5;
    node5->next=node6;
    
    Solution so=Solution();
    ListNode *newHead=so.addTwoNumbers(node1, node4);
    printNode(newHead);

    return 0;
}



