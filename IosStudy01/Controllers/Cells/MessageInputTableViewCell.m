//
//  MessageInputTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageInputTableViewCell.h"
#import "Masonry/Masonry.h"

@implementation MessageInputTableViewCell

-(void)prepare {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.senderNameLabel];
    
    self.bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleInBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(7.5f, 15.0f, 7.5f, 15.0f)];
    [self.contentView addSubview:self.bubbleImageView];

}

-(void)placeSubViews {
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(AVATAR_DIMEN));
        make.top.equalTo(@20);
        make.left.equalTo(@HONRIZONTAL_MARGIN);
    }];
    
    [self.senderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(HONRIZONTAL_MARGIN);
        make.top.equalTo(self.avatarImageView);
    }];
    
    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.senderNameLabel);
        make.top.equalTo(self.senderNameLabel.mas_bottom).offset(2.0);
        make.bottom.equalTo(self.contentView).offset(-HONRIZONTAL_MARGIN);
        make.right.equalTo(self.contentView).offset(-(AVATAR_DIMEN));
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
