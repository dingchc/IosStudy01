//
//  Toolkit.m
//  
//
//  Created by Ding on 7/29/17.
//
//

#import "Toolkit.h"

@implementation Toolkit

/**
 * 获取输入字符串的拼音
 */
+ (NSString*) getPinyin:(NSString *)inputString {
    NSMutableString* pinyin = [inputString mutableCopy];
    
    CFStringTransform((__bridge CFMutableStringRef) pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    
    NSLog(@"%@", pinyin);
    
    CFStringTransform((__bridge CFMutableStringRef) pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    return pinyin;

}

/**
 * 获取给定的随机数
 */
+ (int) randomIntFrom:(int)from to:(int)to {
    
    int ret = 0;
    
    ret = (int) (from + (arc4random() % (to - from + 1)));
    
    return ret;
}

/**
 * 获取一个随机名字
 */
+ (NSString*) getARandomChineseName {
    
    NSArray* firstNameArray = [NSArray arrayWithObjects:@"丁", @"毛", @"刘", @"陈", @"好", @"甲", nil];
    
    NSArray* secondNameArray = [NSArray arrayWithObjects:@"大", @"小", @"强", @"中", @"山", @"灵", nil];
    
    NSArray* lastNameArray = [NSArray arrayWithObjects:@"明", @"毛", @"飞", @"亮", @"海", @"急", nil];
    
    int from = 0;
    int to = 5;
    
    int firstRandom = [self randomIntFrom:from to:to];
    int secondRandom = [self randomIntFrom:from to:to];
    int thirdRandom = [self randomIntFrom:from to:to];
    
    NSString* name = [NSString stringWithFormat:@"%@%@%@", firstNameArray[firstRandom], secondNameArray[secondRandom], lastNameArray[thirdRandom]];
                      
    return name;
    
}
@end
