//
//  LoginViewController.m
//  IosStudy01
//
//  Created by ding on 08/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "LoginViewController.h"
#import "MyTabBarController.h"
#import "UIImage+MISColor.h"
#import "ThreadController.h"
#import "DrawerViewController.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"
#import "CoreManager.h"
#import "MISAppConfig.h"

#define PADDING_LEFT 10

@interface LoginViewController ()

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UIView* accountBgView;
@property(nonatomic, strong) UILabel* accountLabel;
@property(nonatomic, strong) UITextField* accountTextField;

@property(nonatomic, strong) UIView* pwdBgView;
@property(nonatomic, strong) UILabel* pwdLabel;
@property(nonatomic, strong) UITextField* pwdTextField;

@property(nonatomic, strong) UIButton* clickButton;

@property(nonatomic, strong) UILabel* redLabel;
@property(nonatomic) BOOL flag;

@end

@implementation LoginViewController

-(instancetype)init {
    
    NSLog(@"LoginViewController init");
    self = [super init];
    
    if (self) {
        [self addKVO];
    }
    return self;
}

-(void)dealloc {
    
    NSLog(@"LoginViewController dealloc");
    
    [self removeKVO];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"KVO changed ... %@", change);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMe:)];
    
    self.navigationItem.title = @"登录";
    
    [self.view addGestureRecognizer: tap];
    
    // 图标
    [self.view addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@96);
        make.width.equalTo(@96);
        make.top.equalTo(self.view).offset(100);
    }];
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://ws1.sinaimg.cn/large/610dc034ly1fj78mpyvubj20u011idjg.jpg"] placeholderImage:[UIImage imageNamed:@"my_page_btn_bg"]];
    
    // 账号
    [self.view addSubview:self.accountBgView];
    [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.accountTextField];
    
    [self.accountBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(self.view).offset(200);
        make.right.equalTo(self.view).offset(-15);
    }];
    
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBgView).offset(5);
        make.width.equalTo(@50);
        make.top.equalTo(self.accountBgView).offset(5);
        make.bottom.equalTo(self.accountBgView).offset(-5);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLabel.mas_right).offset(5);
        make.height.equalTo(self.accountLabel);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.accountLabel);
    }];
    
    // 密码
    [self.view addSubview:self.pwdBgView];
    [self.view addSubview:self.pwdLabel];
    [self.view addSubview:self.pwdTextField];
    
    [self.pwdBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.accountBgView.mas_bottom).offset(20);
        make.width.equalTo(self.accountBgView);
        make.height.equalTo(self.accountBgView);
    }];
    
    [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pwdBgView).offset(5);
        make.width.equalTo(@50);
        make.top.equalTo(self.pwdBgView).offset(5);
        make.bottom.equalTo(self.pwdBgView).offset(-5);
    }];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pwdLabel.mas_right).offset(5);
        make.height.equalTo(self.pwdLabel);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.pwdLabel);
    }];
    
    // 点击按钮
    [self.view addSubview:self.clickButton];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBgView.mas_left);
        make.top.equalTo(self.pwdBgView.mas_bottom).offset(20);
        make.width.equalTo(self.accountBgView);
        make.height.equalTo(@(44));
    }];
    
//    [self.view addSubview:self.redLabel];
//
//    [self.redLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.equalTo(@50);
//    }];
    
    
    // Do any additional setup after loading the view.
}

-(void) addKVO {
    [[CoreManager instance] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void) removeKVO {
    [[CoreManager instance] removeObserver:self forKeyPath:@"name"];
}

-(void) tapMe:(UIGestureRecognizer * )recognizer {
    [self.view  endEditing:YES];

    self.flag = !self.flag;

//
//
//    [UIView animateWithDuration:2 animations:^{
//        self.redLabel.backgroundColor = [UIColor greenColor];
//    }];
    
    
    CGPoint center = self.redLabel.center;
//    center.x += 20;
    center.y += 20;

    
    [UIView animateWithDuration:0.25 animations:^{
//        self.redLabel.backgroundColor = [UIColor greenColor];
        self.redLabel.center = center;
    }];
    
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.redLabel.text = @"456";
//    });

    [self performSelector:@selector(timeon:) withObject:@1 afterDelay:1];
    
//    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"]];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"]];
        UIImage* image = [UIImage imageWithData:data];
                
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%s, %@", __FUNCTION__, image);
        });
    });
    
}

- (void)timeon:(id )obj {
    NSLog(@"%s, %@", __FUNCTION__, obj);
    self.redLabel.text = @"888";
}

/**
 * 图标
 */
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"my_favorite_bg"];
    }
    return _iconImageView;
}

/**
 * 账号背景
 */
-(UIView *)accountBgView {
    
    if (!_accountBgView) {
        _accountBgView = [[UIView alloc] init];
        _accountBgView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _accountBgView.layer.borderWidth = 1.0;
        _accountBgView.layer.cornerRadius = 3;
        _accountBgView.clipsToBounds = YES;
    }
    
    return _accountBgView;
}

/**
 * 密码背景
 */
-(UIView *)pwdBgView {
    if (!_pwdBgView) {
        _pwdBgView = [[UIView alloc] init];
        _pwdBgView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _pwdBgView.layer.borderWidth = 1.0;
        _pwdBgView.layer.cornerRadius = 3;
        _pwdBgView.clipsToBounds = YES;
    }
    return _pwdBgView;
}

/**
 * 账号标签
 */
-(UILabel *)accountLabel {
    
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc] init];
        _accountLabel.font = [UIFont systemFontOfSize:15];
        _accountLabel.text = @"账号";
        _accountLabel.textAlignment = NSTextAlignmentCenter;
//        _accountLabel.backgroundColor = [UIColor blackColor];
//        _accountLabel.textColor = [UIColor greenColor];
    }
    
    return _accountLabel;
}

/**
 * 密码标签
 */
-(UILabel *)pwdLabel {
    if (!_pwdLabel) {
        _pwdLabel = [[UILabel alloc] init];
        _pwdLabel.font = [UIFont systemFontOfSize:15];
        _pwdLabel.text = @"密码";
        _pwdLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _pwdLabel;
}

/**
 * 账号输入框
 */
-(UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.font = [UIFont systemFontOfSize:15];
        _accountTextField.placeholder = @"please input account... ";
        _accountTextField.textColor = [UIColor blackColor];
        _accountTextField.keyboardType = UIKeyboardTypeNumberPad;
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    
    return _accountTextField;
}

/**
 * 密码输入框
 */
-(UITextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.font = [UIFont systemFontOfSize:15];
        _pwdTextField.placeholder = @"please input pwd...";
        _pwdTextField.textColor = [UIColor blackColor];
        _pwdTextField.keyboardType = UIKeyboardTypeDefault;
        _pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    
    return _pwdTextField;
}

/**
 * 点击按钮
 */
-(UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clickButton.layer.cornerRadius = 5;
        _clickButton.clipsToBounds = YES;
        [_clickButton setTitle:@"登录" forState:UIControlStateNormal];
        [_clickButton setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_clickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_clickButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_clickButton addTarget:self action:@selector(goNextPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

-(UILabel *)redLabel {
    if (!_redLabel) {
        _redLabel = [[UILabel alloc] init];
        _redLabel.backgroundColor = [UIColor redColor];
        _redLabel.textAlignment = NSTextAlignmentCenter;
        _redLabel.text=@"123";
        _redLabel.textColor = [UIColor whiteColor];
        _redLabel.font=[UIFont systemFontOfSize:20];
        _redLabel.layer.cornerRadius = 25;
        _redLabel.clipsToBounds = YES;
    }
    
    return _redLabel;
}

-(void)goMainPage {
    
    MyTabBarController* controller = [[MyTabBarController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)goNextPage {
//    ThreadController* controller = [[ThreadController alloc] init];
    
    DrawerViewController *controller = [[DrawerViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end

#undef PADDING_LEFT
