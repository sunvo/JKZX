//
//  ListItemModel.h
//  JKZX
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ListItemModel <NSObject>
@end

@interface ListItemModel : JSONModel

@property NSString *Description;
@property NSString *title;
@property NSInteger Id;
@property NSString *img;

@end
