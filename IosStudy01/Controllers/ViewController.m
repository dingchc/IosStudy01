//
//  ViewController.m
//  IosStudy01
//
//  Created by ding on 8/17/15.
//  Copyright (c) 2015 ding. All rights reserved.
//

#import "ViewController.h"
#import "DataListViewController.h"
#import "LoginViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@property (nonatomic, assign) int marginLeft;
@property (nonatomic, strong) UILabel* labelAccount;
@property (nonatomic, strong) UITextField* textFieldAccount;
@property (nonatomic, strong) UILabel* labelPwd;
@property (nonatomic, strong) UITextField* textFieldPwd;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIImageView * avatarImageView;

@end

@implementation ViewController


#pragma mark - LifeCycel

- (instancetype)init {
    self = [super init];
    if (self) {
        ///>>>
        self.marginLeft = 20;
        
    }
    return self;
}

- (void)dealloc {
    //>>>
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.view addSubview:self.label];
    
    [self.view addSubview:self.textFieldAccount];
    
    [self.view addSubview:self.textFieldPwd];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"login" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(CGRectGetMaxX(self.labelAccount.frame), CGRectGetMaxY(self.textFieldPwd.frame) + 20, 300, 50);
    [self.button setBackgroundColor:[UIColor lightGrayColor]];
//    [self.button setImage:[UIImage imageNamed:@"title_btn_confirm_normal"] forState:UIControlStateNormal];
//    [self.button setImage:[UIImage imageNamed:@"title_btn_confirm_pressed"] forState:UIControlStateHighlighted];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];

    [self.navigationController setToolbarHidden:true];
    
    // add bar btn
    UIBarButtonItem* addBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    
    UIBarButtonItem* playBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(toolbarClick)];
    
    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[spaceItem, addBtnItem, spaceItem, playBtnItem, spaceItem];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //>>>>
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



#pragma mark - Private

#pragma mark - Getter & Setter


- (UILabel *)labelAccount {
    
    if (!_labelAccount) {
        _labelAccount = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelAccount.text = @"账号：";
        _labelAccount.textAlignment = NSTextAlignmentCenter;
        _labelAccount.textColor = [UIColor darkGrayColor];
        [_labelAccount sizeToFit];
    }
    
    return _labelAccount;
}

- (UITextField *)textFieldAccount {
    
    if (!_textFieldAccount) {
        _textFieldAccount = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.labelAccount.frame), 200, 300, 50)];
        _textFieldAccount.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldAccount.placeholder = @"Please input account.";
        _textFieldAccount.leftView = self.labelAccount;
        _textFieldAccount.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return _textFieldAccount;
}

- (UILabel *)labelPwd {
    
    if (!_labelPwd) {
        _labelPwd = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPwd.text = @"密码：";
        _labelPwd.textAlignment = NSTextAlignmentCenter;
        _labelPwd.textColor = [UIColor darkGrayColor];
        [_labelPwd sizeToFit];
    }
    
    return _labelPwd;
}

- (UITextField *)textFieldPwd {
    
    if (!_textFieldPwd) {
        _textFieldPwd = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.labelPwd.frame), CGRectGetMaxY(self.textFieldAccount.frame) + 20, 300, 50)];
        _textFieldPwd.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldPwd.placeholder = @"Please input pwd.";
        _textFieldPwd.leftView = self.labelPwd;
        _textFieldPwd.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return _textFieldPwd;
}


- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        
        UIImage* image = [UIImage imageNamed:@"title_btn_confirm_normal"];
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.button.frame), image.size.width, image.size.height)];
        _avatarImageView.image = image;

    }
    
    return _avatarImageView;
}

#pragma mark - Event

- (void)buttonClick {
//    DataListViewController* controller = [[DataListViewController alloc] init];
//    controller.name = @"111-222";
//    [self.navigationController pushViewController:controller animated:YES];
    
    LoginViewController* controller = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


-(void) toolbarClick {
    
    UIAlertView* alertView = nil;
    NSString* title = @"提示";
    
    alertView = [[UIAlertView alloc] initWithTitle:title message:@"click with button" delegate:self cancelButtonTitle:@"cancel"
                                 otherButtonTitles:@"ok", @"other", nil];
    
    [alertView show];
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%s, click is %@", __func__, @(buttonIndex));
}

@end
