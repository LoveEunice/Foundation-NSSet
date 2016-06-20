//
//  main.m
//  Foundation-NSSet
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSSet 特性：无序性，唯一性（元素间互异）
        NSArray *arr1=@[@"hello",@"one",@"two",@"hello"];
        NSLog(@"arr1=%@",arr1);
        NSDictionary *dic1=@{@"name":@"xiaoming",@"age":@"21",@"name2":@"xiaoming"};
        NSLog(@"dic1=%@",dic1);
        //不可变
        NSSet *set1=[[NSSet alloc] initWithObjects:@"红楼梦",@"西游记",@"水浒传",@"三国演义", nil];
        NSLog(@"set1=%@",set1);
        //和数组的关系
        NSSet *set2=[NSSet setWithArray:arr1];//数组变集合
        NSArray *newArr=[set1 allObjects];//集合变数组
        NSLog(@"newArr:%@",newArr);
        NSLog(@"set2==%@",set2);
        //集合元素个数
        NSLog(@"set1=%ld,set2=%ld",set1.count,set2.count);
        //是否包含某元素
        if([set2 containsObject:@"one"])
        {
            NSLog(@"contain");
        }
        //两个集合是否相等
        if (![set2 isEqualToSet:set1])
        {
            NSLog(@"not equal");
        }
        //遍历 快速枚举
        for (id obj in set1)
        {
            NSLog(@"%@",obj);
        }
        //判断一个集合是否包含另一个集合
        NSSet *set3=[NSSet setWithObjects:@"hello",@"one", nil];
        if ([set3 isSubsetOfSet:set2])
        {
            NSLog(@"YES");
        }
        else
        {
            NSLog(@"NO");
        }
        //可变集合 NSMutableSet
        NSMutableSet *mulSet=[[NSMutableSet alloc] initWithCapacity:10];
        //添加
        [mulSet addObject:@"ios开发"];
        [mulSet addObjectsFromArray:arr1];
        NSLog(@"mulSet:%@",mulSet);
        //删除 有则删除
        [mulSet removeObject:@"one"];
        NSLog(@"mulSet:%@",mulSet);
        [mulSet unionSet:set3];//并集
        NSLog(@">>mulSet:%@",mulSet);
        [mulSet minusSet:[[NSSet alloc] initWithObjects:@"one",@"two", nil]];//补集
        NSLog(@">>mulSet:%@",mulSet);
        
        //指数集合（索引集合）NSIndexSext
        NSIndexSet *inSet=[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 2)];
        //根据集合提取该位置的内容
        NSArray *newArr2=[arr1 objectsAtIndexes:inSet];
        NSLog(@"newarr2=%@",newArr2);
        //可变索引集合
        NSMutableIndexSet *mulInset=[[NSMutableIndexSet alloc] initWithIndex:1];
        //添加索引
        [mulInset addIndex:2];
        NSArray *newArr3=[arr1 objectsAtIndexes:mulInset];
        NSLog(@"newArr3=%@",newArr3);
        //删除索引
        [mulInset removeIndex:1];
        NSLog(@"%@,%@",newArr3,[arr1 objectsAtIndexes:mulInset]);
    }
    return 0;
}
