//
//  LoginViewController.m
//  IosStudy01
//
//  Created by ding on 08/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#define PADDING_LEFT 10

@interface LoginViewController ()

@property(nonatomic, strong) UIView* accountBgView;
@property(nonatomic, strong) UILabel* accountLabel;
@property(nonatomic, strong) UITextField* accountTextField;

@property(nonatomic, strong) UILabel* redLabel;
@property(nonatomic) BOOL flag;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMe:)];
    [self.view addGestureRecognizer: tap];
    
    [self.view addSubview:self.accountBgView];
    
    [self.view addSubview:self.accountLabel];
    
    [self.view addSubview:self.accountTextField];
    
    [self.accountBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(self.view).offset(100);
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
    
    [self.view addSubview:self.redLabel];
    
    [self.redLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(@50);
    }];
    
    
    // Do any additional setup after loading the view.
}

-(void) tapMe:(UIGestureRecognizer * )recognizer {
//    [self.view  endEditing:YES];
//
//    self.flag = !self.flag;
//
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

-(UIView *)accountBgView {
    
    if (!_accountBgView) {
        _accountBgView = [[UIView alloc] init];
        _accountBgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _accountBgView.layer.borderWidth = 1.0;
        _accountBgView.layer.cornerRadius = 10;
        _accountBgView.clipsToBounds = YES;
    }
    
    return _accountBgView;
}

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

-(UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.font = [UIFont systemFontOfSize:15];
        _accountTextField.placeholder = @"please holder ... ";
        _accountTextField.textColor = [UIColor greenColor];
        _accountTextField.keyboardType = UIKeyboardTypeNumberPad;
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    
    return _accountTextField;
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

//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}
@end

#undef PADDING_LEFT
