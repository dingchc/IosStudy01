//
//  ContactEntry.m
//  IosStudy01
//
//  Created by ding on 7/27/17.
//  Copyright © 2017 ding. All rights reserved.
//

#import "ContactEntry.h"
#import "Toolkit.h"

@implementation ContactEntry

# pragma - static function

+ (ContactEntry*) entryWithName:(NSString *)name withAge:(NSUInteger)age {
    ContactEntry* obj = [[ContactEntry alloc] init];
    
    obj.name = name;
    obj.age = age;
    obj.pinyin = [ Toolkit getPinyin:name];
    
    return obj;
}

# pragma - function
- (NSString*) getPinyinName {
    return [NSString stringWithFormat:@"%@ -- %@", self.name, self.pinyin];
}



@end
