//
//  InformationDataController.m
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "InformationDataController.h"
#import "ClassificationModel.h"
#import "LIstModel.h"

#import <AFNetworking.h>

@implementation InformationDataController

+ (void)getCallbackWithClassificationModelDelegate:(id<NetworkCallbackDelegate>)delegate RequestCode:(NSInteger)requestCode{
    NSString *address = @"http://apis.baidu.com/tngou/info/classify";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"8b7c36a82b729536154378e1bf63a603" forHTTPHeaderField:@"apikey"];
    [manager GET:address parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *jsonError;
        ClassificationModel *classModel = [[ClassificationModel alloc] initWithDictionary:responseObject error:&jsonError];
        if (jsonError) {
            if (delegate) {
                [delegate callbackWithErrorCode:-1 Message:@"网络解析错误" innerError:jsonError RequestCode:requestCode];
            }
        }else{
            if (delegate) {
                [delegate callbackWithData:classModel];
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"------------%@",error);
    }];
}

+ (void)getCallbackWithId:(NSInteger)Id Page:(NSInteger)pag ClassificationModelDelegate:(id<NetworkCallbackDelegate>)delegate RequestCode:(NSInteger)requestCode{
    NSString *address = @"http://apis.baidu.com/tngou/info/list";
    NSNumber *num_id = [NSNumber numberWithInteger:Id];
    NSNumber *num_page = [NSNumber numberWithInteger:pag];
    NSDictionary *parameters = @{@"id":num_id,@"page":num_page,@"rows":@"20"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"8b7c36a82b729536154378e1bf63a603" forHTTPHeaderField:@"apikey"];
    [manager GET:address parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *jsonErron;
        LIstModel *listModel = [[LIstModel alloc] initWithDictionary:responseObject error:&jsonErron];
        if (jsonErron) {
            if (delegate) {
                [delegate callbackWithErrorCode:-1 Message:@"网络解析错误" innerError:jsonErron RequestCode:requestCode];
            }
        }else{
            if (delegate) {
                [delegate callbackWithData:listModel];
            }
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"------------%@",error);
    }];
}

@end
