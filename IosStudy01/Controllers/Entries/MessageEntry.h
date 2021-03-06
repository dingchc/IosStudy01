//
//  MessageEntry.h
//  IosStudy01
//
//  Created by Ding on 22/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MessageEntry : NSObject

@property(nonatomic) NSInteger msgId;

@property(nonatomic, copy) NSString* avatarUrl;
@property(nonatomic) NSInteger senderId;
@property(nonatomic, copy) NSString* senderName;
@property(nonatomic, copy) NSString* content;
@property(nonatomic) NSInteger recvTime;
@property(nonatomic) BOOL isInput;

/**
 * 消息类型:1-文本、2-图片、4-语音、8-公共账号
 */
@property(nonatomic) NSInteger type;

@property(nonatomic) NSInteger audioLength;
@property(nonatomic, copy) NSString* thumbUrl;
@property(nonatomic, copy) NSString* url;

/**
 * 图片大小
 */
@property(nonatomic, assign) CGSize imageSize;

+(MessageEntry*) initWithMsgId:(NSInteger) msgId withSenderId:(NSInteger) senderId withSenderName:(NSString*) senderName withContent:(NSString*) content withAvatar:(NSString*) avatarUrl;
@end
