//
//  TopicListViewController.m
//  IosStudy01
//
//  Created by Ding on 17/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "TopicListViewController.h"
#import "TopicTableViewCell.h"

@interface TopicListViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView* topicTableView;
@property(nonatomic, strong) NSMutableArray* topicMutableArray;

@end

@implementation TopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"消息"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - callback

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicTableViewCell* cell = (TopicTableViewCell*) [self.topicTableView dequeueReusableCellWithIdentifier:@"cellTag"];
    return cell;
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
