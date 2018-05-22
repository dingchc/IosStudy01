//
//  CustomDrawerViewController.m
//  IosStudy01
//
//  Created by Ding on 2018/5/16.
//  Copyright © 2018 ding. All rights reserved.
//

#import "DrawerViewController.h"
#import "CustomView.h"
#import <sqlite3.h>
#import "FMDatabase.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* dbPath = [paths.firstObject stringByAppendingPathComponent:@"1.sqlite"];
    
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    [db executeUpdate:@"create table if not "];
    
    FMResultSet* set = [db executeQuery:@""];
    while ([set next]) {
        [set stringForColumn:@"name"];
    }
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CustomView* view = [[CustomView alloc] initWithFrame:CGRectMake(0, 64, screenSize.width, screenSize.height)];
    
    [self.view addSubview:view];
    
    [self parseJson];
}


- (void) parseJson {
    
    NSString *jsonStr = @"{\"error_code\":1,\"error_msg\":\"成功\",\"data\":{\"stu_array\":[{\"name\":\"学生A\",\"age\":12},{\"name\":\"学生B\",\"age\":13}]}}";
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"dictionary=%@", dictionary);
    
    NSDictionary *dataDict = dictionary[@"data"];
    NSLog(@"dataDict=%@", dataDict);
    
    NSArray* stuDictArray = dataDict[@"stu_array"];
    
    for (NSDictionary* stuDict in stuDictArray) {
        NSLog(@"stuDict=%@", stuDict);
        NSString* name = stuDict[@"name"];
        NSLog(@"name=%@", name);
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
