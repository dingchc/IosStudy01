//
//  CoreManager.h
//  IosStudy01
//
//  Created by Ding on 2018/6/4.
//  Copyright © 2018 ding. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CoreManager : NSObject

@property(nonatomic, copy) NSString* name;

+ (CoreManager *) instance;

- (void) afGet;

/**
 * 下载文件
 */
-(void) downloadFileWithUrl:(NSString *) url;

@end
