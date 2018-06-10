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
#import "MISAppConfig.h"
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
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bubbleImageView).insets(UIEdgeInsetsMake(10.0, 15.0f, 10.0f, 10.0));
    }];
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
    }
    return _senderNameLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x + 20, 46, self.frame.size.width - AVATAR_DIMEN * 2 - 20, 40)];
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
        _bubbleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x, 36, self.frame.size.width - AVATAR_DIMEN*2, 60)];
        _bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleInBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(7.5f, 15.0f, 7.5f, 15.0f)];
    }
    return _bubbleImageView;
}

@end

#undef AVATAR_DIMEN
#undef HONRIZONTAL_MARGIN

