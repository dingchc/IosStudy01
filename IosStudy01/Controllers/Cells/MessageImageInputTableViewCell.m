//
//  MessageImageInputTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageImageInputTableViewCell.h"
#import "MessageEntry.h"
#import <Masonry/Masonry.h>
#import "MISAppConfig.h"
#import "UIImageView+WebCache.h"

@implementation MessageImageInputTableViewCell

-(void)prepare {
    
    [super prepare];
    [self.contentView addSubview:self.contentImageView];
}

-(void)placeSubViews {
    
    [super placeSubViews];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bubbleImageView).insets(UIEdgeInsetsMake(10.0, 15.0f, 10.0f, 10.0));
    }];
}

-(void)updateCellWithObj:(id)obj {
    
    if (obj) {
        MessageEntry * entry = obj;
        // use sd webimage
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:entry.avatarUrl] placeholderImage:[UIImage imageNamed:@"Avatar_default_medium"]];
        
        self.senderNameLabel.text = entry.senderName;
        
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:entry.thumbUrl] placeholderImage:[UIImage imageNamed:@"Thumb_Placeholder"]];
    }
}

# pragma Getter & Setter

-(UIImageView *)contentImageView {
    
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
    }
    return _contentImageView;
}

@end
