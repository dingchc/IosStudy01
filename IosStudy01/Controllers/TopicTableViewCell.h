//
//  TopicTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 17/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MISTableViewCell.h"

@interface TopicTableViewCell : MISTableViewCell
@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* contentLabel;
@property(nonatomic, strong) UILabel* timeLabel;
@end
