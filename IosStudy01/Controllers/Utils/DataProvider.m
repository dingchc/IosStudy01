//
//  DataProvider.m
//  IosStudy01
//
//  Created by Ding on 2018/6/19.
//  Copyright © 2018 ding. All rights reserved.
//

#import "DataProvider.h"
#import "MessageEntry.h"

static DataProvider * instance;

@implementation DataProvider

+(DataProvider *) provider {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataProvider alloc] init];
    });
    
    return instance;
}

-(NSArray *)getMessageArray {
    
    NSMutableArray *messageMutebleArray = [[NSMutableArray alloc] init];
    
    NSString *senderAvatarUrl = @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2529469200,1162169902&fm=27&gp=0.jpg";
    NSString *mySelfAvatarUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521652236226&di=49fe9ae20e31319b618e2e7364d9e96c&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F15%2F01%2F07958PICJg8_1024.jpg";
    
    MessageEntry* entry1 = [MessageEntry initWithMsgId:1 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"今天天气还行，出来玩吧，一起去抓鸟，好吗？加油，快点出来!今天天气还行，出来玩吧，一起去抓鸟，好吗？加油，快点出来!" withAvatar:mySelfAvatarUrl];
    
    [messageMutebleArray addObject:entry1];
    
    MessageEntry* entry2 = [MessageEntry initWithMsgId:2 withSenderId:1 withSenderName:@"毛毛" withContent:@"准备放学了" withAvatar:senderAvatarUrl];
    entry2.isInput = YES;
    [messageMutebleArray addObject:entry2];
    
    MessageEntry* entry3 = [MessageEntry initWithMsgId:3 withSenderId:2 withSenderName:@"毛毛" withContent:@"锁作为并发共享数据，保证一致性的工具，在JAVA平台有多种实现(如 synchronized 和 ReentrantLock等等 ) 。这些已经写好提供的锁为我们开发提供了便利，但是锁的具体性质以及类型却很少被提及。本系列文章将分析JAVA中常见的锁以及其特性，为大家答疑解惑。" withAvatar:senderAvatarUrl];
    
    entry3.isInput = YES;
    [messageMutebleArray addObject:entry3];
    
    // 图片
    MessageEntry* entry5 = [MessageEntry initWithMsgId:5 withSenderId:1 withSenderName:@"毛毛" withContent:@"" withAvatar:senderAvatarUrl];
    entry5.type = 2;
    entry5.isInput = YES;
    // 小图 https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4167116097,2538574550&fm=15&gp=0.jpg
    // 中图 http://img5.imgtn.bdimg.com/it/u=415783616,2172665037&fm=27&gp=0.jpg
    entry5.thumbUrl = @"http://img5.imgtn.bdimg.com/it/u=415783616,2172665037&fm=27&gp=0.jpg";
    
    [messageMutebleArray addObject:entry5];
    
    MessageEntry* entry4 = [MessageEntry initWithMsgId:1 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"阻塞锁，可以说是让线程进入阻塞状态进行等待，当获得相应的信号（唤醒，时间） 时，才可以进入线程的准备就绪状态，准备就绪状态的所有线程，通过竞争，进入运行状态。JAVA中，能够进入退出、阻塞状态或包含阻塞锁的方法有 ，synchronized 关键字（其中的重量锁）." withAvatar:mySelfAvatarUrl];
    
    [messageMutebleArray addObject:entry4];
    
    // 图片
    MessageEntry* entry6 = [MessageEntry initWithMsgId:6 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"" withAvatar:mySelfAvatarUrl];
    entry6.type = 2;
    entry6.thumbUrl = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3641472529,2956520928&fm=27&gp=0.jpg";
    
    [messageMutebleArray addObject:entry6];
    
    // 语音
    MessageEntry* entry7 = [MessageEntry initWithMsgId:7 withSenderId:2 withSenderName:@"毛毛" withContent:@"" withAvatar:senderAvatarUrl];
    entry7.type = 4;
    entry7.isInput = YES;
    
    [messageMutebleArray addObject:entry7];
    
    // 语音
    MessageEntry* entry8 = [MessageEntry initWithMsgId:8 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"" withAvatar:mySelfAvatarUrl];
    entry8.type = 4;
    entry8.isInput = NO;
    
    [messageMutebleArray addObject:entry8];
    
    
    
    return [messageMutebleArray copy];
}

@end
