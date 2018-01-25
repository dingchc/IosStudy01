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
#import "MessageViewController.h"

#define CELL_TAG @"my_tag"

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
    TopicEntry* entry2 = [TopicEntry entryWithTitle:@"毛毛水电费水电费水电费水电费水电费第三方水水电费水电费水电费水电费水电费第三方水" withContent:@"今天去公园" withTime:@"2017-08-30 12-22"];
    TopicEntry* entry3 = [TopicEntry entryWithTitle:@"牛牛" withContent:@"水电费水电费水电费水电费水电费第三方水电费水电费负担分为若翁热无热热无若" withTime:@"10-22"];
    self.topicArray = @[entry1, entry2, entry3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - callback

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicTableViewCell* cell = (TopicTableViewCell*) [self.topicTableView dequeueReusableCellWithIdentifier:[TopicTableViewCell reuseIdentifier]];
    
    TopicEntry* entry = self.topicArray[indexPath.row];

    [cell updateCellWithObj:entry];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.topicArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicEntry* entry = self.topicArray[indexPath.row];
    return [TopicTableViewCell heightForCellWithObj:entry];
}

-(UITableView *)topicTableView {
    if (!_topicTableView) {
        _topicTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    }
    _topicTableView.delegate = self;
    _topicTableView.dataSource = self;
    _topicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_topicTableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:[TopicTableViewCell reuseIdentifier]];
    
    return _topicTableView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%s -- %d -- %ld", __FUNCTION__, __LINE__, indexPath.row);
    
    MessageViewController* controller = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%s", __FUNCTION__);
    // 删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteARowAtIndexPath:indexPath];
        [self.topicTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}

-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}

/**
 * 删除一行
 * @param indexPath 一行
 */
-(void)deleteARowAtIndexPath:(NSIndexPath *) indexPath {
    
    NSMutableArray* mutableArray = [self.topicArray mutableCopy];
    
    [mutableArray removeObjectAtIndex:indexPath.row];
    
    self.topicArray = [[NSArray alloc] initWithArray:mutableArray];
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

#undef CELL_TAG
