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

@implementation MessageTextInputTableViewCell

-(void)prepare {
    
    [super prepare];
    [self.contentView addSubview:self.contentLabel];
}

-(void)placeSubViews {
    [super placeSubViews];
    
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

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x + 20, 46, self.frame.size.width - AVATAR_DIMEN * 2 - 20, 40)];
        _contentLabel.textColor = UIColor.blackColor;
        _contentLabel.font = [UIFont systemFontOfSize : 12];
        _contentLabel.numberOfLines = 0;
		_contentLabel.preferredMaxLayoutWidth = VIEW_WIDTH - AVATAR_DIMEN * 2 - HONRIZONTAL_MARGIN * 2 - 25.0f;
		_contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

@end

