//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//

#include <iostream>
#pragma mark - 交换单链表相邻的节点
//Given 1->2->3->4, you should return the list as 2->1->4->3.

struct Node {
    int data;
    Node *next;
    Node(int x)
    {
        data = x;
        next = NULL;
    }
};
void printNode(Node *root){

    Node *node=root;
    while (node!=NULL) {
        printf("%d\n",node->data);
        node=node->next;
    }
}

Node * swapNode(Node *root){
    if (root==NULL||root->next==NULL) {
        return root;
    }
    Node *head=root->next;
//1  2   3  4  5
    Node *prev=root;//上一对节点的第二个点
    Node *cur=root;//下一对节点的第一个点
    while (cur!=NULL&&cur->next!=NULL) {
        prev->next=cur->next;
        Node *next=cur->next->next;//存储下一对交换的第一个节点
        cur->next->next=cur;
        cur->next=next;
        prev=cur;
        cur=next;
    }
    return head;

}

int main()
{
        Node *node1=new Node(1);
        Node *node2=new Node(2);
        Node *node3=new Node(3);
        Node *node4=new Node(4);
        Node *node5=new Node(5);
        node1->next=node2;
        node2->next=node3;
        node3->next=node4;
        node4->next=node5;
        printNode(swapNode(node1));
    return 0;
}



