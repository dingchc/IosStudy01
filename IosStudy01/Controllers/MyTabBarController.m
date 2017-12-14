//
//  MyTabBarController.m
//  IosStudy01
//
//  Created by ding on 14/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "MyTabBarController.h"
#import "DataListViewController.h"
#import "ViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DataListViewController* contactViewController = [[DataListViewController alloc] init];
    
    contactViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"联系人"
                                                                     image:[UIImage imageNamed:@"tab_message"]
                                                             selectedImage:[UIImage imageNamed:@"tab_message"]];
    
    ViewController* configViewController = [[ViewController alloc] init];
    
    configViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置"
                                                                    image:[UIImage imageNamed:@"tab_message_hl_teacher"]
                                                            selectedImage:[UIImage imageNamed:@"tab_message_hl_teacher"]];
    
    configViewController.tabBarItem.badgeValue = @"999";
    
    self.viewControllers=@[contactViewController, configViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
