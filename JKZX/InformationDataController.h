//
//  InformationDataController.h
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkCallbackDelegate.h"

@interface InformationDataController : NSObject

+ (void)getCallbackWithClassificationModelDelegate:(id<NetworkCallbackDelegate>)delegate RequestCode:(NSInteger)requestCode;

+ (void)getCallbackWithId:(NSInteger)Id Page:(NSInteger)pag ClassificationModelDelegate:(id<NetworkCallbackDelegate>)delegate RequestCode:(NSInteger)requestCode;

@end
