//
//  main.m
//  leetcode
//
//  Created by liusong on 2018/12/18.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Node{
    int age;
    Node(int a){
        age=a;
    }
};

int main(int argc, const char * argv[]) {
    Node *node1;
    {
        Node *node2=new Node(20);
        node1=node2;
    }
    
    printf("");

    return 0;
}
