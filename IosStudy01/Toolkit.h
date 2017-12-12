//
//  Toolkit.h
//  
//
//  Created by Ding on 7/29/17.
//
//

#import <Foundation/Foundation.h>

@interface Toolkit : NSObject

/**
 * 获取输入字符串的拼音
 */
+ (NSString*) getPinyin:(NSString*)inputString;

/**
 * 获取给定的随机数
 */
+ (int) randomIntFrom:(int)from to:(int)to;

/**
 * 获取一个随机名字
 */
+ (NSString*) getARandomChineseName;
@end
