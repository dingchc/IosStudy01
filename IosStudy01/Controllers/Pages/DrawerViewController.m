//
//  CustomDrawerViewController.m
//  IosStudy01
//
//  Created by Ding on 2018/5/16.
//  Copyright © 2018 ding. All rights reserved.
//

#import "DrawerViewController.h"
#import "CustomView.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CustomView* view = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    
    [self.view addSubview:view];
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
