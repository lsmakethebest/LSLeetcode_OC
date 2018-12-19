//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//

#include <iostream>

#pragma mark - Z型二叉树打印
/*
            1
      2           3
    4   5        6  7
8         9
 
打印顺序应为 1 3 2 4 5 6 7 9 8
 
 */
struct Node
{
    int data;
    Node *left,*right;
    Node(int x)
    {
        data = x;
        left = right = NULL;
    }
};


int nodehHeight(Node *node)
{
    if (!node) {
        return 0;
    }
    int lh=nodehHeight(node->left);
    int rh=nodehHeight(node->right);
    return (lh>rh)?lh+1:rh+1;
}

void printGivenNode(Node*node,int level,bool order)
{
    if (!node) {
        return;
    }
    if (level==1) {
        printf("%d\n",node->data);
    }else{
        if (order) {
            printGivenNode(node->left, level-1, order);
            printGivenNode(node->right, level-1, order);
        }else{
            printGivenNode(node->right, level-1, order);
            printGivenNode(node->left, level-1, order);
        }
    }
}


void printNode(Node *root)
{
    int height=nodehHeight(root);
    bool order=true;
    for (int i=1; i<=height; i++) {
        printGivenNode(root,i, order);
        order=!order;
    }
}


int main() {

        Node *root=new Node(1);
        root->left = new Node(3);
        root->left->left = new Node(2);
        root->left->right = new Node(1);
        root->left->right->left = new Node(1);
        root->right = new Node(-1);
        root->right->left = new Node(4);
        root->right->left->left = new Node(1);
        root->right->left->right = new Node(2);
        root->right->right = new Node(5);
        root->right->right->right = new Node(2);

        printNode(root);

    return 0;
}





