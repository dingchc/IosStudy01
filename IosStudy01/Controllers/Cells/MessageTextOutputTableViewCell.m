//
//  MessageTextOutputTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/5.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageTextOutputTableViewCell.h"
#import "MISAppConfig.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"
#import "MessageEntry.h"

#define AVATAR_DIMEN 36
#define HONRIZONTAL_MARGIN 10

@implementation MessageTextOutputTableViewCell

-(void)prepare {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.senderNameLabel];
    [self.contentView addSubview:self.bubbleImageView];
    [self.contentView addSubview:self.contentLabel];
}

-(void)placeSubViews {
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@AVATAR_DIMEN);
        make.height.equalTo(@AVATAR_DIMEN);
        make.right.equalTo(self.contentView).offset(@-HONRIZONTAL_MARGIN);
        make.top.equalTo(@10);
    }];
    
    [self.senderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.avatarImageView.mas_left).offset(@-HONRIZONTAL_MARGIN);
        make.top.equalTo(self.avatarImageView);
    }];
    
    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.senderNameLabel.mas_bottom).offset(2.0);
        make.left.equalTo(@AVATAR_DIMEN);
        make.right.equalTo(self.senderNameLabel.mas_right);
        make.bottom.equalTo(self.contentView).offset(-HONRIZONTAL_MARGIN);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bubbleImageView).insets(UIEdgeInsetsMake(10.0, 10.0f, 10.0f, 15.0));}];
}

-(void)updateCellWithObj:(id)obj {
    
    if (obj) {
        MessageEntry * entry = obj;
        // use sd webimage
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:entry.avatarUrl] placeholderImage:[UIImage imageNamed:@"Avatar_default_medium"]];
        
        self.senderNameLabel.text = entry.senderName;
        self.contentLabel.text = entry.content;
    }
}

# pragma Getter & Setter

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 10 - AVATAR_DIMEN, 20, AVATAR_DIMEN, AVATAR_DIMEN)];
    }
    _avatarImageView.image = [UIImage imageNamed:@"Avatar_default_small"];
    return _avatarImageView;
}

-(UILabel *)senderNameLabel {
    if (!_senderNameLabel) {
        _senderNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.frame.origin.x - HONRIZONTAL_MARGIN - 80, 10, 80, 30)];
        _senderNameLabel.textColor = UIColor.grayColor;
        _senderNameLabel.font = [UIFont systemFontOfSize : 12];
        _senderNameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _senderNameLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        
        int width = self.frame.size.width - AVATAR_DIMEN * 2 - 20;
        CGFloat x = (self.senderNameLabel.frame.origin.x + self.senderNameLabel.frame.size.width) - width;
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, 46, width, 40)];
        _contentLabel.textColor = UIColor.blackColor;
        _contentLabel.font = [UIFont systemFontOfSize : 14];
        _contentLabel.numberOfLines = 0;
        _contentLabel.preferredMaxLayoutWidth = VIEW_WIDTH - AVATAR_DIMEN * 2 - HONRIZONTAL_MARGIN * 2 - 25.0f;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

-(UIImageView *)previewImageView {
    if (!_previewImageView) {
        _previewImageView = [[UIImageView alloc]init];
    }
    return _previewImageView;
}

-(UIImageView *)audioImageView {
    if (!_audioImageView) {
        _audioImageView = [[UIImageView alloc]init];
    }
    return _audioImageView;
}

- (UIImageView *)bubbleImageView {
    if (!_bubbleImageView) {
        
        int width = self.frame.size.width - AVATAR_DIMEN * 2;
        CGFloat x = (self.senderNameLabel.frame.origin.x + self.senderNameLabel.frame.size.width) - width;
        
        _bubbleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 36, width, 60)];
        _bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleOutBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 7.5f, 7.5f, 15.0f)];
    }
    return _bubbleImageView;
}

@end

#undef AVATAR_DIMEN
#undef HONRIZONTAL_MARGIN
