//
//  MessageTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 25/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "MessageEntry.h"
#import <Masonry/Masonry.h>

@implementation MessageTableViewCell

-(void)prepare {
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.senderNameLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.previewImageView];
    [self.contentView addSubview:self.audioImageView];
}

-(void)placeSubViews {
    
    // 头像
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    // 内容
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView).offset(10);
        make.top.equalTo(self.avatarImageView).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
    }];
}

-(void)updateCellWithObj:(id)obj {
    
    MessageEntry* entry = (MessageEntry*) obj;
    self.senderNameLabel.text = entry.senderName;
    self.contentLabel.text = entry.content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

# pragma Getter & Setter

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
    }
    
    _avatarImageView.image = [UIImage imageNamed:@"Avatar_default_small"];
    return _avatarImageView;
}

-(UILabel *)senderNameLabel {
    if (!_senderNameLabel) {
        _senderNameLabel = [[UILabel alloc]init];
    }
    return _senderNameLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
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

@end
