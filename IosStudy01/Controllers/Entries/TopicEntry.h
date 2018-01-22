//
//  TopicEntry.h
//  IosStudy01
//
//  Created by Ding on 18/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicEntry : NSObject
@property(nonatomic, strong) NSString* avatarUrl;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* content;
@property(nonatomic, strong) NSString* recvTime;

+(TopicEntry*) entryWithTitle: (NSString*) title withContent:(NSString*) content withTime:(NSString*) time;
@end
