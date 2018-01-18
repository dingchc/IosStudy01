//
//  ConfigEntry.m
//  IosStudy01
//
//  Created by Ding on 10/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "ConfigEntry.h"

@implementation ConfigEntry

+(ConfigEntry*) entryWithTitle:(NSString*) title withIcon:(NSString*) icon withMode:(NSInteger) mode {
    
    ConfigEntry* entry = [[ConfigEntry alloc] init];
    entry.title = title;
    entry.iconName = icon;
    entry.itemMode = mode;
    return entry;
}

@end
