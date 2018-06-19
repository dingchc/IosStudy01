//
//  MessageOutputTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageOutputTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation MessageOutputTableViewCell

-(void)prepare {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.senderNameLabel];
    
    self.bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleOutBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 7.5f, 7.5f, 15.0f)];
    [self.contentView addSubview:self.bubbleImageView];
}

-(void)placeSubViews {
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@AVATAR_DIMEN);
        make.height.equalTo(@AVATAR_DIMEN);
        make.right.equalTo(self.contentView).offset(-HONRIZONTAL_MARGIN);
        make.top.equalTo(@10);
    }];

    [self.senderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.avatarImageView.mas_left).offset(-HONRIZONTAL_MARGIN);
        make.top.equalTo(self.avatarImageView);
    }];

    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.senderNameLabel.mas_bottom).offset(2.0);
        make.left.greaterThanOrEqualTo(@AVATAR_DIMEN);
        make.right.equalTo(self.senderNameLabel.mas_right);
        make.bottom.equalTo(self.contentView).offset(-HONRIZONTAL_MARGIN);
    }];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
