//
//  ItemsModel.h
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ItemsModel <NSObject>
@end

@interface ItemsModel : JSONModel

@property NSString *Description;
@property NSInteger Id;
@property NSString *title;

@end
