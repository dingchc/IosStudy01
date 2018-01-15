//
//  ConfigEntry.h
//  IosStudy01
//
//  Created by Ding on 10/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigEntry : NSObject
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* iconName;

+(ConfigEntry*) entryWithTitle:(NSString*) title withIcon:(NSString*) icon;
@end
