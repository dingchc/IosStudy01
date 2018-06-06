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
#import "MessageEntry.h"
#import "UIImageView+WebCache.h"

#define TAG_INPUT @"tag_input"
#define TAG_OUTPUT @"tag_output"
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
    
    for (int i = 0; i < 10; i++) {
        MessageEntry* entry = [MessageEntry initWithMsgId:i withSenderId:i withSenderName:@"丁崇慈" withContent:@"今天天气还行，出来玩吧，一起去抓鸟，好吗？加油，快点出来!" withAvatar:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521652236226&di=49fe9ae20e31319b618e2e7364d9e96c&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F15%2F01%2F07958PICJg8_1024.jpg"];
        [self.messageArray addObject:entry];
    }
}

#pragma Callback
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MessageEntry* entry = self.messageArray[indexPath.row];
    
    MessageTextInputTableViewCell* cell = nil;
    
    // input msg
    if (entry.senderId % 3 == 0) {
        
        cell = [self.messageTableView dequeueReusableCellWithIdentifier:TAG_INPUT];
    }
    // output msg
    else {
        cell = [self.messageTableView dequeueReusableCellWithIdentifier:TAG_OUTPUT];
    }
    
    // use sd webimage
    [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:entry.avatarUrl] placeholderImage:[UIImage imageNamed:@"Avatar_default_medium"]];
    
    cell.senderNameLabel.text = entry.senderName;
    cell.contentLabel.text = entry.content;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}


#pragma Getter & Setter
-(UITableView *)messageTableView {
    
    if (!_messageTableView){
        _messageTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _messageTableView.dataSource = self;
        _messageTableView.delegate = self;
        _messageTableView.separatorStyle = UITableViewCellEditingStyleNone;
    }
    
    [_messageTableView registerClass:[MessageTextInputTableViewCell class] forCellReuseIdentifier:TAG_INPUT];
    [_messageTableView registerClass:[MessageTextOutputTableViewCell class] forCellReuseIdentifier:TAG_OUTPUT];
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
