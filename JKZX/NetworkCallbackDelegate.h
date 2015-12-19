//
//  NetworkCallbackDelegate.h
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkCallbackDelegate <NSObject>

- (void)callbackWithData:(id)data;

@optional

- (void)callbackWithErrorCode:(NSInteger)errorCode Message:(NSString *)Message innerError:(NSError *)error RequestCode:(NSInteger)requestCode;

@end
