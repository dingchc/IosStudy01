//
//  ContactEntry.h
//  IosStudy01
//
//  Created by ding on 7/27/17.
//  Copyright © 2017 ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactEntry : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic) NSUInteger age;
@property(nonatomic, copy) NSString *pinyin;


/**
 * 初始化
 */
+ (ContactEntry*) entryWithName:(NSString *)name withAge:(NSUInteger)age;

/**
 * 获取拼音
 */
- (NSString*) getPinyinName;


@end
