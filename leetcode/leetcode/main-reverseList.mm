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

#pragma mark - 翻转链表

struct ListNode
{
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(NULL) {}
};

class Solution
{
public:
    ListNode* reverseList(ListNode* H) {
        if (H == NULL || H->next == NULL) //链表为空或者仅1个节点直接返回
            return H;
        ListNode *p=H;
        ListNode *newH=NULL;
        while (p!=NULL)                 //一直迭代到链尾
        {
            ListNode *tmp=p->next;          //暂存p下一个地址，防止变化指针指向后找不到后续的数
            p->next=newH;               //p->next指向前一个空间
            newH=p;                     //新链表的头移动到p，扩长一步链表
            p=tmp;                   //p指向原始链表p指向的下一个空间
        }
        return newH;
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
    ListNode *newHead=so.reverseList(node1);
    printNode(newHead);

    return 0;
}



