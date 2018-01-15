//
//  MyTabBarController.m
//  IosStudy01
//
//  Created by ding on 14/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "MyTabBarController.h"
#import "DataListViewController.h"
#import "TopicListViewController.h"
#import "ViewController.h"
#import "ConfigViewController.h"

@interface MyTabBarController () <UITabBarDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    
    // 话题列表
    TopicListViewController* topicViewController = [[TopicListViewController alloc] init];
    topicViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"tab_message"]
                                                           selectedImage:[UIImage imageNamed:@"tab_message"]];
    topicViewController.tabBarItem.badgeValue = @"3";
    
    // 联系人
    DataListViewController* contactViewController = [[DataListViewController alloc] init];
    
    contactViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"联系人"
                                                                     image:[UIImage imageNamed:@"tab_message"]
                                                             selectedImage:[UIImage imageNamed:@"tab_message"]];
    
    // 设置
    ConfigViewController* configViewController = [[ConfigViewController alloc] init];
    
    configViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置"
                                                                    image:[UIImage imageNamed:@"tab_message_hl_teacher"]
                                                            selectedImage:[UIImage imageNamed:@"tab_message_hl_teacher"]];
    
    
    
    self.viewControllers=@[topicViewController, contactViewController, configViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * tabBar选择回调
 */
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    self.title = item.title;
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
