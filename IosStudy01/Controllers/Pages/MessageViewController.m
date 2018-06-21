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
#import "MessageImageOutputTableViewCell.h"
#import "MessageAudioInputTableViewCell.h"
#import "MessageAudioOutputTableViewCell.h"
#import "MessageEntry.h"
#import "UIImageView+WebCache.h"
#import "DataProvider.h"
#import "CoreManager.h"


@interface MessageViewController() <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView* messageTableView;
@property(nonatomic, strong) NSMutableArray* messageArray;
@end

@implementation MessageViewController

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyImageReady:) name:NOTIFY_IMAGE_READY object:nil];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    NSLog(@"screen size is width:%f, height:%f", screenSize.width, screenSize.height);
    
    [self  initData];
    [self.view addSubview:self.messageTableView];
    
    [[CoreManager instance] downloadFileWithUrl:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2249478252,3079196793&fm=27&gp=0.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData {
    
    [self.messageArray addObjectsFromArray:[[DataProvider provider] getMessageArray]];
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
        if (entry.type == 1) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageTextInputTableViewCell reuseIdentifier]];
        }
        else if (entry.type == 2) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageImageInputTableViewCell reuseIdentifier]];
        }
        else if (entry.type == 4) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageAudioInputTableViewCell reuseIdentifier]];
        }
    } else {
        
        if (entry.type == 1) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageTextOutputTableViewCell reuseIdentifier]];
        }
        else if (entry.type == 2) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageImageOutputTableViewCell reuseIdentifier]];
        }
        else if (entry.type == 4) {
            cell = [self.messageTableView dequeueReusableCellWithIdentifier:[MessageAudioOutputTableViewCell reuseIdentifier]];
        }
    }
    
//    NSLog(@"cellForRowAtIndexPath -- %ld", indexPath.row);
    [cell updateCellWithObj:entry];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

-(CGFloat)tableView:(MessageTableViewCell *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    MessageEntry* entry = self.messageArray[indexPath.row];
    CGFloat height = 0;
    
    if (entry.isInput) {
        
        if (entry.type == 1) {
            height = [MessageTextInputTableViewCell heightForCellWithObj:entry];
        }
        else if (entry.type == 2) {
            height = [MessageImageInputTableViewCell heightForCellWithObj:entry];
        }
        else if (entry.type == 4) {
            height = [MessageAudioInputTableViewCell heightForCellWithObj:entry];
        }
    } else {
        
        if (entry.type == 1) {
            height = [MessageTextOutputTableViewCell heightForCellWithObj:entry];
        }
        else if (entry.type == 2) {
            height = [MessageImageOutputTableViewCell heightForCellWithObj:entry];
        }
        else if (entry.type == 4) {
            height = [MessageAudioOutputTableViewCell heightForCellWithObj:entry];
        }
    }
    
    return height;
}

/**
 * 收到图片加载完毕的通知
 */
-(void)notifyImageReady : (NSNotification*) notification {
    
    int row = [self findMessageIndexWithMsg:[notification object]];
    
    NSLog(@"receive notification %d", row);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self.messageTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
}

/**
 * 查找消息的索引
 */
-(int)findMessageIndexWithMsg:(MessageEntry *) matchMessage {
    
    NSArray* msgs = [[NSArray alloc]initWithArray:self.messageArray];
    int index = -1;
    int i = 0;
    
    for (MessageEntry *msg in msgs) {
        
        if (msg == matchMessage) {
            index = i;
            break;
        }
        i++;
    }
    
    return index;
}


#pragma Getter & Setter
-(UITableView *)messageTableView {
    
    if (!_messageTableView){
        _messageTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _messageTableView.dataSource = self;
        _messageTableView.delegate = self;
        _messageTableView.separatorStyle = UITableViewCellEditingStyleNone;
    }
    
    [_messageTableView registerClass:[MessageTextInputTableViewCell class] forCellReuseIdentifier:[MessageTextInputTableViewCell reuseIdentifier]];
    [_messageTableView registerClass:[MessageTextOutputTableViewCell class] forCellReuseIdentifier:[MessageTextOutputTableViewCell reuseIdentifier]];
    
    [_messageTableView registerClass:[MessageImageInputTableViewCell class] forCellReuseIdentifier:[MessageImageInputTableViewCell reuseIdentifier]];
    [_messageTableView registerClass:[MessageImageOutputTableViewCell class] forCellReuseIdentifier:[MessageImageOutputTableViewCell reuseIdentifier]];
    
    [_messageTableView registerClass:[MessageAudioInputTableViewCell class] forCellReuseIdentifier:[MessageAudioInputTableViewCell reuseIdentifier]];
    [_messageTableView registerClass:[MessageAudioOutputTableViewCell class] forCellReuseIdentifier:[MessageAudioOutputTableViewCell reuseIdentifier]];
    
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
