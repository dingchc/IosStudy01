//
//  MessageImageInputTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MISTableViewCell.h"

@interface MessageImageInputTableViewCell : MISTableViewCell

@property(nonatomic, strong) UIImageView* avatarImageView;
@property(nonatomic, strong) UILabel* senderNameLabel;
@property(nonatomic, strong) UIImageView* contentImageView;
@property(nonatomic, strong) UIImageView* bubbleImageView;

@end
