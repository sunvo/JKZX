//
//  ListItemModel.m
//  JKZX
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "ListItemModel.h"

@implementation ListItemModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                      @"id":@"Id",
                                                      @"description":@"Description"
                                                       }];
}

@end
