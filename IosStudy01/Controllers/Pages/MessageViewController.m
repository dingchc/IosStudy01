//
//  MessageViewController.m
//  IosStudy01
//
//  Created by Ding on 25/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTextInputTableViewCell.h"
#import "MessageTextOutputTableViewCell.h"
#import "MessageImageInputTableViewCell.h"
#import "MessageEntry.h"
#import "UIImageView+WebCache.h"

#define TAG_INPUT_TEXT @"tag_input_text"
#define TAG_INPUT_IMAGE @"tag_input_image"
#define TAG_INPUT_AUDIO @"tag_input_audio"
#define TAG_OUTPUT_TEXT @"tag_output_text"
#define TAG_OUTPUT_IMAGE @"tag_output_image"
#define TAG_OUTPUT_AUDIO @"tag_output_audio"
#define TAG_SECTION @"tag_section"


@interface MessageViewController() <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView* messageTableView;
@property(nonatomic, strong) NSMutableArray* messageArray;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    NSLog(@"screen size is width:%f, height:%f", screenSize.width, screenSize.height);
    
    [self  initData];
    [self.view addSubview:self.messageTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData {
    
    NSString *senderAvatarUrl = @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2529469200,1162169902&fm=27&gp=0.jpg";
    NSString *mySelfAvatarUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521652236226&di=49fe9ae20e31319b618e2e7364d9e96c&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F15%2F01%2F07958PICJg8_1024.jpg";
    
    MessageEntry* entry1 = [MessageEntry initWithMsgId:1 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"今天天气还行，出来玩吧，一起去抓鸟，好吗？加油，快点出来!今天天气还行，出来玩吧，一起去抓鸟，好吗？加油，快点出来!" withAvatar:mySelfAvatarUrl];
    
    [self.messageArray addObject:entry1];
    
    MessageEntry* entry2 = [MessageEntry initWithMsgId:2 withSenderId:1 withSenderName:@"毛毛" withContent:@"准备放学了" withAvatar:senderAvatarUrl];
    entry2.isInput = YES;
    [self.messageArray addObject:entry2];
    
    MessageEntry* entry3 = [MessageEntry initWithMsgId:3 withSenderId:2 withSenderName:@"毛毛" withContent:@"锁作为并发共享数据，保证一致性的工具，在JAVA平台有多种实现(如 synchronized 和 ReentrantLock等等 ) 。这些已经写好提供的锁为我们开发提供了便利，但是锁的具体性质以及类型却很少被提及。本系列文章将分析JAVA中常见的锁以及其特性，为大家答疑解惑。" withAvatar:senderAvatarUrl];
    
    entry3.isInput = YES;
    [self.messageArray addObject:entry3];
    
    
    MessageEntry* entry4 = [MessageEntry initWithMsgId:1 withSenderId:1 withSenderName:@"丁崇慈" withContent:@"阻塞锁，可以说是让线程进入阻塞状态进行等待，当获得相应的信号（唤醒，时间） 时，才可以进入线程的准备就绪状态，准备就绪状态的所有线程，通过竞争，进入运行状态。JAVA中，能够进入退出、阻塞状态或包含阻塞锁的方法有 ，synchronized 关键字（其中的重量锁）." withAvatar:mySelfAvatarUrl];
    
    [self.messageArray addObject:entry4];
    
    // 图片
    MessageEntry* entry5 = [MessageEntry initWithMsgId:5 withSenderId:1 withSenderName:@"毛毛" withContent:@"" withAvatar:senderAvatarUrl];
    entry5.type = 2;
    
    [self.messageArray addObject:entry5];
    

}

#pragma Callback
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MessageEntry* entry = self.messageArray[indexPath.row];
    
    MISTableViewCell* cell = nil;
    
    // input msg
    if (entry.isInput) {
        cell = [self.messageTableView dequeueReusableCellWithIdentifier:TAG_INPUT_TEXT];
    }
    // output msg
    else {
        cell = [self.messageTableView dequeueReusableCellWithIdentifier:TAG_OUTPUT_TEXT];
    }
    
    [cell updateCellWithObj:entry];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    MessageEntry* entry = self.messageArray[indexPath.row];
    CGFloat height = 0;
    
    if (entry.isInput) {
        height = [MessageTextInputTableViewCell heightForCellWithObj:entry];
        NSLog(@"1 height=%f", height);
    } else {
        height = [MessageTextOutputTableViewCell heightForCellWithObj:entry];
        NSLog(@"2 height=%f", height);
    }
    return height;
}


#pragma Getter & Setter
-(UITableView *)messageTableView {
    
    if (!_messageTableView){
        _messageTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _messageTableView.dataSource = self;
        _messageTableView.delegate = self;
        _messageTableView.separatorStyle = UITableViewCellEditingStyleNone;
    }
    
    [_messageTableView registerClass:[MessageTextInputTableViewCell class] forCellReuseIdentifier:TAG_INPUT_TEXT];
    [_messageTableView registerClass:[MessageTextOutputTableViewCell class] forCellReuseIdentifier:TAG_OUTPUT_TEXT];
    
    [_messageTableView registerClass:[MessageImageInputTableViewCell class] forCellReuseIdentifier:TAG_INPUT_IMAGE];
    [_messageTableView registerClass:[MessageImageInputTableViewCell class] forCellReuseIdentifier:TAG_INPUT_IMAGE];
    
    return _messageTableView;
}

-(NSMutableArray *)messageArray {
    
    if (!_messageArray) {
        _messageArray = [[NSMutableArray alloc] init];
    }
    return _messageArray;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

#undef TAG_INPUT
#undef TAG_OUTPUT
#undef TAG_SECTION
