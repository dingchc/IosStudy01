//
//  MessageTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#ifndef MESSAGE_TABLE_VIEW_CELL_H
#define MESSAGE_TABLE_VIEW_CELL_H

#import <UIKit/UIKit.h>
#import "MISTableViewCell.h"

#define AVATAR_DIMEN 36.0f
#define HONRIZONTAL_MARGIN 10.0f

@interface MessageTableViewCell : MISTableViewCell

@property(nonatomic, strong) UIImageView* avatarImageView;
@property(nonatomic, strong) UILabel* senderNameLabel;
@property(nonatomic, strong) UIImageView* bubbleImageView;

@end

#endif
