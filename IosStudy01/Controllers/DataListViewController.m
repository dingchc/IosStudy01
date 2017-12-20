//
//  DataListViewController.m
//  IosStudy01
//
//  Created by ding on 7/26/17.
//  Copyright © 2017 ding. All rights reserved.
//

#import "DataListViewController.h"
#import "MyTableViewCell.h"
#import "ContactEntry.h"
#import "Toolkit.h"


@interface DataListViewController () <UITableViewDataSource, UITableViewDelegate>


@property(nonatomic, strong) UITableView* dataTableView;

@property(nonatomic, strong) NSMutableArray* contacts;

@property(nonatomic, copy) NSDictionary* contactDictionary;

@end

@implementation DataListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.dataTableView];
    
    // 初始化联系人数组
//    [self fillContactArray];
    
    // 初始化联系人字典
    [self fillContactDictionary];
    
    NSLog(@"name=%@", self.name);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark callback

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell* cell = [tableView_ req];
    
    NSLog(@"%ld", indexPath.row);
    
    NSMutableArray* contactArray = [self.contactDictionary objectForKey : self.contacts[indexPath.section]];
    
    ContactEntry* entry = contactArray[indexPath.row];

    MyTableViewCell * cell = (MyTableViewCell*)[self.dataTableView dequeueReusableCellWithIdentifier:@"cellTag"];
    
    // Configure the cell.
    
    cell.titleLabel.text = [entry getPinyinName];
    cell.iconImageView.image = [UIImage imageNamed:@"avatar_default_big.jpg"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString* key = [self.contacts objectAtIndex:section];
    
    return [[self.contactDictionary objectForKey:key] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contacts count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.contacts objectAtIndex:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section=%ld row = %ld", indexPath.section,indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray* documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString* filePath = [documentPaths.firstObject stringByAppendingPathComponent:@"1.jpg"];
    
    NSLog(@"filePath=%@", filePath);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.thebeijinger.com/files/u216958/Easter_Sunday_Brunch___Kranzler___s.jpg"]];
    
    [data writeToFile:filePath atomically:YES];
    
//    cell.iconImageView.image = [UIImage imageWithData:data];
    
    
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSArray* sectionTitles = self.contacts;
    return sectionTitles;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSMutableArray* sectionArray = [self.contactDictionary objectForKey:[self.contacts objectAtIndex:indexPath.section]];
        ContactEntry* deleteContact = [sectionArray objectAtIndex:indexPath.row];
        
        [sectionArray removeObject:deleteContact];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}



#pragma mark - Setter & Getter

-(UITableView *)dataTableView {
    
    if (!_dataTableView) {
        _dataTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    }
    
    _dataTableView.delegate = self;
    _dataTableView.dataSource = self;
    
    [_dataTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cellTag"];
    return _dataTableView;
}

#pragma mark - Logic

-(void) fillContactArray {
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (int i= 0; i < 6; i++) {
        
        NSString* name = [Toolkit getARandomChineseName];
        
        ContactEntry* contact = [ContactEntry entryWithName:name withAge:11];
        //        [array addObject:contact];
        array[i] = contact;
    }
    
//    self.contactArray = array;
}

/**
 * 填充联系人的字典
 */
-(void) fillContactDictionary {
    
    //Sort Array
    NSMutableArray* datas = [[NSMutableArray alloc] init];
    
    for (int i= 0; i < 20; i++) {
        
        NSString* name = [Toolkit getARandomChineseName];
        
        ContactEntry* contact = [ContactEntry entryWithName:name withAge:11];
        
        datas[i] = contact;
        
    }
    
    [datas sortUsingComparator:^NSComparisonResult(ContactEntry*  obj1, ContactEntry* obj2) {
        return [obj1.pinyin compare:obj2.pinyin];
    }];
    
    // create array - dictionary
    
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] init];
    
    self.contacts = [[NSMutableArray alloc] init];
    
    for (int i= 0; i < datas.count; i++) {
        
        ContactEntry* contact = datas[i];
        
        NSString* key = [contact.pinyin substringToIndex:1];
        
        NSLog(@"key=%@", key);
        
        BOOL isContains = [self.contacts containsObject:key];
        
        if (!isContains) {

            [self.contacts addObject:key];
        }

        NSLog(@"count=%@", @([self.contacts count]));
        
        NSMutableArray* valueArray = [dictionary objectForKey:key];
        
        if (!valueArray) {
            valueArray = [[NSMutableArray alloc] init];
        }
        
        [valueArray addObject:contact];
                
        [dictionary setValue:valueArray forKey:key];
        
    }
    
    self.contactDictionary = dictionary;
    
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
