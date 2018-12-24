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

/*  1->2->3->4->5->6->7
 先反转中间部分 m=3,n=5
    1->2  3<-4<-5  6->7
 
 保存1 和5节点
 
 将2->next=5  3->next=6
 
 */
class Solution
{
public:
    ListNode* reverseBetween(ListNode* head, int m, int n) {
        if(head == NULL || n - m <= 0)
            return head;
        
        //第一轮for使用
        ListNode* cur = head;
        ListNode* start = cur;//保存2号结点
        ListNode* end = cur;//保存3号结点
        
        int i = 1;
        for(; i < m ; i++){
            start = cur;
            cur = cur->next;
            end = cur;
        }
        //此时cur->3  start->2 end->3
        
        //第二轮for使用 交换节点
        ListNode* prev = NULL;
        ListNode* next = NULL;
        
        for(i = 0; i <= n - m ; i++){
            next = cur->next;
            cur->next = prev;
            prev = cur;
            cur = next;
        }
        //此时next->6 start->2 end->3  实现了 3<-4<-5  prev->5  cur->6
        
        start->next = prev;//2 的next指向 5
        end->next = cur;//3 的next指向 6
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
    ListNode *node6=new ListNode(6);
    ListNode *node7=new ListNode(7);
    node1->next=node2;
    node2->next=node3;
    node3->next=node4;
    node4->next=node5;
    node5->next=node6;
    node6->next=node7;
    Solution so=Solution();
    ListNode *newHead=so.reverseBetween(node1, 3, 5);
    printNode(newHead);

    return 0;
}



