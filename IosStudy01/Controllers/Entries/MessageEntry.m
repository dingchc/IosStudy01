//
//  MessageEntry.m
//  IosStudy01
//
//  Created by Ding on 22/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageEntry.h"

@implementation MessageEntry

+(MessageEntry*) initWithMsgId:(NSInteger) msgId withSenderId:(NSInteger) senderId withSenderName:(NSString*) senderName {
    
    MessageEntry* entry = [[MessageEntry alloc] init];
    entry.msgId = msgId;
    entry.senderId = senderId;
    
    return entry;
}
@end
