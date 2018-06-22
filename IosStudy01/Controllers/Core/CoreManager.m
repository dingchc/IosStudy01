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
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];

    [manager POST:@"https://www.apiopen.top/meituApi" parameters:@{@"page":@"2"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@", error);
    }];
    
}

/**
 * 下载文件
 */
-(void) downloadFileWithUrl:(NSString *) url completeBlock:(CompleteBlock) block {
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] init];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"completed = %lld, total = %lld", downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSArray *documentPaths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *destinationPath = [documentPaths.firstObject stringByAppendingPathComponent:response.suggestedFilename];
        
        return [NSURL fileURLWithPath:destinationPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"filePath=%@", filePath);
        NSLog(@"error=%@", error);
        
        block(filePath);
    }];
    
    [downloadTask resume];
}

@end
