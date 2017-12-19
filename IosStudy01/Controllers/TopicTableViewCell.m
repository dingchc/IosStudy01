//
//  TopicTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 17/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "TopicEntry.h"
#import "MISAppConfig.h"
#import <Masonry/Masonry.h>

@implementation TopicTableViewCell

-(void)prepare {
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.bottomLine];
}

-(void)placeSubViews {
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(MIS_PAGE_MARGIN);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@44);
        make.height.equalTo(@44);
//        make.topMargin.equalTo(@10);
//        make.bottomMargin.equalTo(@10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(MIS_PAGE_MARGIN);
        make.top.equalTo(self.contentView).offset(MIS_PAGE_MARGIN);
        make.height.equalTo(@20);
        make.right.lessThanOrEqualTo(self.timeLabel.mas_left).offset(-MIS_PAGE_MARGIN);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView).offset(-MIS_PAGE_MARGIN);
        make.height.equalTo(@18);
        make.width.greaterThanOrEqualTo(@50);
    }];

    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(@5);
        make.right.equalTo(self.contentView).offset(-MIS_PAGE_MARGIN);
        make.bottom.equalTo(self.contentView).offset(-MIS_PAGE_MARGIN);
    }];

    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(MIS_PAGE_MARGIN);
        make.right.equalTo(self.contentView).offset(-MIS_PAGE_MARGIN);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@(MIS_ONE_PX));
    }];
}

-(UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.image = [UIImage imageNamed:@"avatar_default_big.jpg"];
    }
    return _avatarImageView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setTextColor:[UIColor grayColor]];
//        [_contentLabel setFont:[UIFont systemFontOfSize:16]];
//        _contentLabel.font=[UIFont systemFontOfSize:16];
        _contentLabel.font = NFont(14);
        
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        // 0 is not limit
        _contentLabel.numberOfLines = 2;
        _contentLabel.preferredMaxLayoutWidth = VIEW_WIDTH - 20;
        
    }
    return _contentLabel;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setTextColor:[UIColor grayColor]];
        [_timeLabel setFont:[UIFont systemFontOfSize:14]];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

-(void)updateCellWithObj:(id)obj {
    TopicEntry* entry = obj;
    self.titleLabel.text = entry.title;
    self.contentLabel.text = entry.content;
    self.timeLabel.text = entry.recvTime;
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
