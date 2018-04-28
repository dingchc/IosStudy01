//
//  ThreadController.m
//  IosStudy01
//
//  Created by ding on 2018/4/28.
//  Copyright © 2018 ding. All rights reserved.
//

#import "ThreadController.h"
#import "UIImage+MISColor.h"
#import <pthread.h>

@interface ThreadController()
@property(nonatomic, strong) UIButton* button;

@end

@implementation ThreadController

-(void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    
}

#pragma mark Getter & Setter

-(UIButton *)button {
    
    if (!_button) {
        
        UIScreen* screen = [UIScreen mainScreen];
        CGFloat buttonWidth = 300;
        
//        _button = [[UIButton alloc] initWithFrame:CGRectMake((screen.width - buttonWidth) / 2, 100, buttonWidth, 40)];
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.layer.cornerRadius = 6;
        [_button setClipsToBounds:TRUE];
        
        _button.frame = CGRectMake((screen.bounds.size.width - buttonWidth) / 2, 100, buttonWidth, 40);
        [_button setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
        [_button setTitle:@"click me" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

-(void) onClick:(id) sender {
    NSLog(@"click...");
    
    pthread_t thread;
    
    NSString* param = @"参数";
    
    int result = pthread_create(&thread, NULL, task, (__bridge void *)param);
    
    pthread_detach(thread);

    NSLog(@"result = %d", result);
}

void * task(void* params) {
    
    NSLog(@"params = %@", (__bridge NSString *)(params));
    
    int value = 0, max = 100;
    
    while(value < max) {
        NSLog(@"value = %d", value);
        value++;
    }
    
    return NULL;
}

@end
