//
//  MessageTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 25/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MISTableViewCell.h"

@interface MessageTextInputTableViewCell : MISTableViewCell

@property(nonatomic, strong) UIImageView* avatarImageView;
@property(nonatomic, strong) UILabel* senderNameLabel;
@property(nonatomic, strong) UILabel* contentLabel;
@property(nonatomic, strong) UIImageView* bubbleImageView;
@property(nonatomic, strong) UIImageView* previewImageView;
@property(nonatomic, strong) UIImageView* audioImageView;

@end
