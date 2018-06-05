//
//  CoreManager.m
//  IosStudy01
//
//  Created by Ding on 2018/6/4.
//  Copyright © 2018 ding. All rights reserved.
//

#import "CoreManager.h"
#import "AFHTTPSessionManager.h"

static CoreManager *instance = nil;
@implementation CoreManager

+(CoreManager *)instance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSLog(@"CoreManager init");
        instance = [[CoreManager alloc] init];
    });
    
    return instance;
}

-(NSString *)name {
    
    if (!_name) {
        _name = @"name_dcc";
    }
    return _name;
}

- (void) afGet {
    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
//
//    [manager POST:@"https://www.apiopen.top/meituApi" parameters:@{@"page":@"2"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"success %@", responseObject);
//
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error %@", error);
//    }];
    
    self.name = @"111";
}

@end
