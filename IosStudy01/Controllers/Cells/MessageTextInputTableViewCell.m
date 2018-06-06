//
//  MessageTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 25/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageTextInputTableViewCell.h"
#import "MessageEntry.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"


#define AVATAR_DIMEN 36
#define HONRIZONTAL_MARGIN 10


@implementation MessageTextInputTableViewCell

-(void)prepare {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.senderNameLabel];
    [self.contentView addSubview:self.bubbleImageView];
    [self.contentView addSubview:self.contentLabel];
}

-(void)placeSubViews {
    
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
        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, AVATAR_DIMEN, AVATAR_DIMEN)];
    }
    
    _avatarImageView.image = [UIImage imageNamed:@"Avatar_default_small"];
    return _avatarImageView;
}

-(UILabel *)senderNameLabel {
    if (!_senderNameLabel) {
        _senderNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.frame.origin.x + self.avatarImageView.frame.size.width + HONRIZONTAL_MARGIN, 10, 80, 30)];
        _senderNameLabel.textColor = UIColor.grayColor;
        _senderNameLabel.font = [UIFont systemFontOfSize : 12];
        _senderNameLabel.preferredMaxLayoutWidth = 80;
    }
    return _senderNameLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x + 20, 46, self.frame.size.width - AVATAR_DIMEN * 2 - 20, 40)];
        _contentLabel.textColor = UIColor.blackColor;
        _contentLabel.font = [UIFont systemFontOfSize : 14];
        _contentLabel.numberOfLines = 2;
        _contentLabel.preferredMaxLayoutWidth = self.frame.size.width - AVATAR_DIMEN * 2 - 20;
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
        _bubbleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x, 36, self.frame.size.width - AVATAR_DIMEN*2, 60)];
        _bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleInBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(7.5f, 15.0f, 7.5f, 15.0f)];
    }
    return _bubbleImageView;
}

@end

#undef AVATAR_DIMEN
#undef HONRIZONTAL_MARGIN

