//
//  MessageTextOutputTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 2018/6/5.
//  Copyright © 2018 ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageTextInputTableViewCell.h"

@interface MessageTextOutputTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView* avatarImageView;
@property(nonatomic, strong) UILabel* senderNameLabel;
@property(nonatomic, strong) UILabel* contentLabel;
@property(nonatomic, strong) UIImageView* bubbleImageView;
@property(nonatomic, strong) UIImageView* previewImageView;
@property(nonatomic, strong) UIImageView* audioImageView;

@end
