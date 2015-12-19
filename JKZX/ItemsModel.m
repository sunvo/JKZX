//
//  ItemsModel.m
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "ItemsModel.h"

@implementation ItemsModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                      @"description":@"Description",
                                                      @"id":@"Id"
                                                       }];
}

@end
