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
#import "UIImageView+WebCache.h"
#import "AFHTTPSessionManager.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据库
    [self initDb];
    
    // 请求
//    [self request];
//    [self doPost];
    [self afGet];
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CustomView* view = [[CustomView alloc] initWithFrame:CGRectMake(0, 64, screenSize.width, screenSize.height)];
    
    [self.view addSubview:view];
    
    [self parseJson];
}

- (void) afGet {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager GET:@"https://www.apiopen.top/meituApi" parameters:@{@"page":@"2"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@", error);
    }];
}

/**
 * 请求
 */
- (void) request {
    
    NSString *url = @"https://www.apiopen.top/novelApi";
    
    NSURL *encodeUrl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:encodeUrl];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"请求完成...");
        if (!error) {
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            id code = resDict[@"code"];
            NSString *msg = resDict[@"msg"];
            
            NSLog(@"code=%@ msg=%@", code, msg);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self processRequest:resDict];
            });
        }
    }];
    
    [task resume];
}

- (void) processRequest:(NSDictionary*)res {
    
    NSArray *array = [res objectForKey:@"data"];
    
    for (NSDictionary* dict in array) {
        NSLog(@"bookName = %@", dict[@"bookname"]);
    }
}

- (void) doPost {
    
    NSString *url = @"https://www.apiopen.top/satinGodApi";
    NSURL *encodeUrl = [NSURL URLWithString:url];
    NSString *post = [NSString stringWithFormat:@"type=%@&page=%@", @1, @1];
    
    NSData *data = [post dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:encodeUrl];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"请求完成...msg=%@", dict[@"msg"]);
    }];
    
    [task resume];
}

- (void) initDb {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* dbPath = [paths.firstObject stringByAppendingPathComponent:@"1.sqlite"];
    
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    [db executeUpdate:@"create table if not exists TABLE_STU(id integer primary key, name text, age integer)  "];
    
    [db executeUpdate:@"insert into TABLE_STU values(1, '甲', 12)"];
    [db executeUpdate:@"insert into TABLE_STU values(2, '乙', 13)"];
    
    FMResultSet* set = [db executeQuery:@"select * from TABLE_STU"];
    
    while ([set next]) {
        
        NSString* name = [set stringForColumn:@"name"];
        int age = [set intForColumn:@"age"];
        
        NSLog(@"name=%@, age=%d", name, age);
    }
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
