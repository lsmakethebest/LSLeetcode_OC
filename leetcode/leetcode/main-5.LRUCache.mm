//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//



#pragma mark - LRU


#include <map>
using namespace std;

class LRUCache{
    
    struct Node{
        int key;
        int value;
        Node *pre;
        Node *next;
        Node(int k,int v):key(k),value(v),pre(NULL),next(NULL){}
    };
    
    int maxSize;
    int curSize;
    Node *head;
    Node *tail;
    typedef Node* KeyNode;
    map<int,KeyNode> cacheMap;
   
public:
    LRUCache(int capacity) {
        maxSize=capacity;
        curSize=0;
        head=new Node(-1,-1);
        tail=new Node(-1,-1);
        head->next=tail;
        tail->pre=head;
    }
    void insertHeadNode(Node* node){
        node->next=head->next;
        node->pre=head;
        head->next->pre=node;
        head->next=node;
    }
    
    void deleteNode(Node* node){
        node->next->pre=node->pre;
        node->pre->next=node->next;
    }
    
    int get(int key) {
        map<int,KeyNode>::iterator iter;
        iter=cacheMap.find(key);
        if (iter==cacheMap.end()) {
            //之前不存在此key
            return -1;
        }else{
            //存在此key
            KeyNode temp = iter->second;
            deleteNode(temp);
            insertHeadNode(temp);
            return temp->value;
        }
        return 10;
    }
    
    void put(int key, int value) {
        map<int,KeyNode>::iterator iter;
        iter=cacheMap.find(key);
        if (iter==cacheMap.end()) {
            //之前不存在此key
            if (curSize>=maxSize) {
                KeyNode freeNode=tail->pre;
                cacheMap.erase(freeNode->key);
                deleteNode(freeNode);
                delete freeNode;
                KeyNode temp=new Node(key,value);
                insertHeadNode(temp);
                cacheMap[key]=temp;
            }else
            {
                KeyNode temp=new Node(key,value);
                insertHeadNode(temp);
                cacheMap[key]=temp;
                curSize++;
            }
        }else{
            //存在此key
            KeyNode temp=iter->second;
            temp->value=value;
            deleteNode(temp);
            insertHeadNode(temp);
        }
        
    }
};

int main()
{
    LRUCache cache = LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    printf("%d\n",cache.get(1));       // 返回  1
    cache.put(3, 3);    // 该操作会使得密钥 2 作废
    printf("%d\n",cache.get(2));       // 返回 -1 (未找到)
    cache.put(4, 4);    // 该操作会使得密钥 1 作废
    printf("%d\n",cache.get(1));       // 返回 -1 (未找到)
    printf("%d\n",cache.get(3));       // 返回  3
    printf("%d\n",cache.get(4));       // 返回  4
    
    return 1;
}




