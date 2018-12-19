//
//  main.m
//  suanfa
//
//  Created by liusong on 2018/12/17.
//  Copyright © 2018年 liusong. All rights reserved.
//
#include <iostream>

#pragma mark - 回文数


void testInt(){
    int num,s,y=0;
/*
    1234321
 
    y=1;
    s=123432;
    
    y=10+2=12
    s=12343
    
    y=12*10+3+123
    s=1234
    
    y=123*10+4=1234
    s=123
    
    y=1234*10+3=12343
    s=12
    
    y=12343*10+2=123432
    s=1
    
    y=123432*10+1=1234321
    s=0
*/
    
    printf("Please input numbers: ");
    scanf("%d", &num);
    s=num;
    while(s>0){
        y=y*10+s%10;
        s=s/10;
    }
    if(y==num){
        printf("%d是一个回文数!\n", num);
    }else{
        printf("%d不是一个回文数!\n", num);
    }
}
void testString()
{
    int i,j,n;
    char a[999],b[999];
    printf("Please input string: ");
    scanf("%s",a);              //输入字符串
    n=strlen(a);                //用strlen函数读取字符串长度（长度到\0停止）
    for(i=0,j=n-1;i<n;i++,j--)  //循环将字符串a逆序赋值给b
        b[j]=a[i];
    
    for(i=0;i<n;i++){
        if(b[i]!=a[i])
            break;                 //判断是否回文
    }
    if(i==n) printf("是一个回文数!\n");     //如果从第1位到n都相同 则输出回文数
    else printf("不是一个回文数!\n");

}

int main()
{
    testInt();
    testString();
    return 1;
}



