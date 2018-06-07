//
//  MessageEntry.m
//  IosStudy01
//
//  Created by Ding on 22/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageEntry.h"

@implementation MessageEntry

+(MessageEntry*) initWithMsgId:(NSInteger) msgId withSenderId:(NSInteger) senderId withSenderName:(NSString*) senderName withContent:(NSString*) content withAvatar:(NSString*) avatarUrl {
    
    MessageEntry* entry = [[MessageEntry alloc] init];
    entry.msgId = msgId;
    entry.senderName = senderName;
    entry.senderId = senderId;
    entry.content = content;
    entry.avatarUrl = avatarUrl;
    
    return entry;
}

-(BOOL)isIsInput {
    if (!_isInput) {
        _isInput = YES;
    }
    return _isInput;
}

@end
