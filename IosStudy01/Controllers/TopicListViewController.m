//
//  TopicListViewController.m
//  IosStudy01
//
//  Created by Ding on 17/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "TopicListViewController.h"
#import "TopicTableViewCell.h"
#import "TopicEntry.h"

@interface TopicListViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView* topicTableView;
@property(nonatomic, strong) NSArray* topicArray;

@end

@implementation TopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"消息"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
    
    // 初始化数据
    [self initData];
    
    [self.view addSubview:self.topicTableView];
    
    
    // Do any additional setup after loading the view.
}

/**
 * 初始化数据
 */
- (void) initData {
    TopicEntry* entry1 = [TopicEntry entryWithTitle:@"丁丁" withContent:@"今天去上班" withTime:@"11-22"];
    TopicEntry* entry2 = [TopicEntry entryWithTitle:@"毛毛" withContent:@"今天去公园" withTime:@"12-22"];
    TopicEntry* entry3 = [TopicEntry entryWithTitle:@"牛牛" withContent:@"今天去山东" withTime:@"10-22"];
    self.topicArray = @[entry1, entry2, entry3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - callback

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicTableViewCell* cell = (TopicTableViewCell*) [self.topicTableView dequeueReusableCellWithIdentifier:@"cellTag"];
    
    TopicEntry* entry = self.topicArray[indexPath.row];
    
    [cell.titleLabel setText:entry.title];
    [cell.contentLabel setText:entry.content];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"今天的消息";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.topicArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableView *)topicTableView {
    if (!_topicTableView) {
        _topicTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    }
    _topicTableView.delegate = self;
    _topicTableView.dataSource = self;
    
    [_topicTableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:@"cellTag"];
    
    return _topicTableView;
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
