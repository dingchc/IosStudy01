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

@implementation MessageTextOutputTableViewCell

-(void)prepare {
    
    [super prepare];
    [self.contentView addSubview:self.contentLabel];
}

-(void)placeSubViews {
    
    [super placeSubViews];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bubbleImageView).insets(UIEdgeInsetsMake(6.0, 6.0f, 6.0f, 13.0));}];
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
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = UIColor.blackColor;
        _contentLabel.font = [UIFont systemFontOfSize : 12];
        _contentLabel.numberOfLines = 0;
        _contentLabel.preferredMaxLayoutWidth = VIEW_WIDTH - AVATAR_DIMEN * 2 - HONRIZONTAL_MARGIN * 2 - 19.0f;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

@end
