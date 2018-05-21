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
    
    [self parseJson];
}


- (void) parseJson {
    NSString *jsonStr = @"{\"error_code\":1,\"error_msg\":\"成功\",\"data\":{\"stu_array\":[{\"name\":\"学生A\",\"age\":12},{\"name\":\"学生B\",\"age\":13}]}}";
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"dictionary=%@", dictionary);
    
    NSObject *obj = [dictionary objectForKey:@"data"];
    NSLog(@"obj=%@", obj);
    
    for (NSDictionary *dic in obj) {
        NSLog(@"name=%@, age=%@", dic[@"name"], dic[@"age"]);
    }
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
