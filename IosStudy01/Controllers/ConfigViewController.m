//
//  ConfigViewController.m
//  IosStudy01
//
//  Created by Ding on 10/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "ConfigViewController.h"
#import "ConfigEntry.h"
#import "ConfigTableViewCell.h"

@interface ConfigViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, copy) NSMutableArray* itemArray;
@property(nonatomic, copy) NSMutableDictionary* itemDictionary;

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma data

/**
 * 初始哈
 */
-(void) initData {
    
    // avatar
    ConfigEntry* avatarEntry = [ConfigEntry entryWithTitle:@"我的信息" withIcon:@"avatar_default_big"];
    NSArray<ConfigEntry*>* avatarArray = [[NSArray alloc] initWithObjects:avatarEntry, nil];
    [self.itemDictionary  setValue:avatarArray forKey:self.itemArray[0]];
    
    // homepage
    ConfigEntry* homePageEntry = [ConfigEntry entryWithTitle:@"我的主页" withIcon:@"my_page_btn_bg"];
    ConfigEntry* favorEntry = [ConfigEntry entryWithTitle:@"我的收藏" withIcon:@"my_favorite_bg"];
    ConfigEntry* creditEntry = [ConfigEntry entryWithTitle:@"我的积分" withIcon:@"my_credits_bg"];
    NSArray<ConfigEntry*>* homePageArray = [[NSArray alloc] initWithObjects:homePageEntry, favorEntry, creditEntry, nil];

    [self.itemDictionary  setValue:homePageArray forKey:self.itemArray[1]];

    // class
    ConfigEntry* classPageEntry = [ConfigEntry entryWithTitle:@"我的班级" withIcon:@"my_favorite_bg"];
    NSArray<ConfigEntry*>* classPageArray = [[NSArray alloc] initWithObjects:classPageEntry, nil];
    [self.itemDictionary  setValue:classPageArray forKey:self.itemArray[2]];

    // config
    ConfigEntry* configEntry = [ConfigEntry entryWithTitle:@"设置" withIcon:@"my_setting_bg"];
    NSArray<ConfigEntry*>* configArray = [[NSArray alloc] initWithObjects:configEntry, nil];
    [self.itemDictionary  setValue:configArray forKey:self.itemArray[3]];
}

#pragma getter & setter

-(NSDictionary *)itemDictionary {
    if (!_itemDictionary) {
        _itemDictionary = [[NSMutableDictionary alloc] init];
    }
    return _itemDictionary;
}

-(NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [[NSMutableArray alloc] initWithObjects:@"avatar", @"homepage", @"class", @"config", nil];
    }
    return _itemArray;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    }
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView registerClass:[ConfigTableViewCell class] forCellReuseIdentifier:@"myCell"];
    return _tableView;
}

#pragma mark - Callback

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString* key = self.itemArray[section];
    
    NSMutableArray* sectionArray = [self.itemDictionary objectForKey:key];
    NSLog(@"section=%ld, key=%@, count1=%ld", section, key, sectionArray.count);

    return sectionArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ConfigTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    NSString* key = self.itemArray[indexPath.section];
    NSArray<ConfigEntry*>* dataArray = [self.itemDictionary objectForKey:key];
    
    ConfigEntry* entry = dataArray[indexPath.row];
    cell.titleLabel.text = dataArray[indexPath.row].title;
    cell.iconImageView.image = [UIImage imageNamed:entry.iconName];
    
    NSLog(@"cell=%@", cell);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"section count=%zd", self.itemArray.count);
    return self.itemArray.count;
}

@end
