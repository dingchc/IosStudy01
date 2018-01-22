//
//  TopicEntry.m
//  IosStudy01
//
//  Created by Ding on 18/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "TopicEntry.h"

@implementation TopicEntry
+(TopicEntry*) entryWithTitle: (NSString*) title withContent:(NSString*) content withTime:(NSString*) time {
    TopicEntry* entry = [[TopicEntry alloc] init];
    entry.title = title;
    entry.content = content;
    entry.recvTime = time;
    
    return entry;
}
@end
