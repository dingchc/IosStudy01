//
//  MessageAudioInputTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/20.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageAudioInputTableViewCell.h"
#import <Masonry/Masonry.h>
#import "MessageEntry.h"
#import "UIImageView+WebCache.h"

@implementation MessageAudioInputTableViewCell

# pragma Override

-(void)prepare {
    
    [super prepare];
    [self addSubview:self.audioImageView];
    [self addSubview:self.lengthLabel];
    
    [self.bubbleImageView setUserInteractionEnabled:YES];
    [self.bubbleImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onAudioTap)]];
}

-(void)placeSubViews {
    
    [super placeSubViews];
    
    [self.audioImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.senderNameLabel).offset(13);
        make.top.equalTo(self.bubbleImageView).offset(6);
        make.width.equalTo(@AUDIO_DIMEN);
        make.height.equalTo(@AUDIO_DIMEN);
    }];
    
    [self.lengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bubbleImageView.mas_right).offset(5);
        make.centerY.equalTo(self.audioImageView.mas_centerY);
        make.height.equalTo(self.audioImageView.mas_height);
        make.width.equalTo(@30);
    }];
}

-(void)updateCellWithObj:(id)obj {
    
    if (obj) {
        
        MessageEntry * entry = obj;
        // use sd webimage
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:entry.avatarUrl] placeholderImage:[UIImage imageNamed:@"Avatar_default_medium"]];
        
        self.senderNameLabel.text = entry.senderName;
        self.lengthLabel.text=[NSString stringWithFormat:@"%ld\"", entry.audioLength];
        
        [self.bubbleImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            int audioWidth = AUDIO_DIMEN + 13 + 6 + (entry.audioLength / 60.0) * MAX_AUDIO_DIMEN;
            int audioHeight = AUDIO_DIMEN + 6 + 6;
            make.width.equalTo(@(audioWidth));
            make.height.equalTo(@(audioHeight));
        }];
    }
}

-(void)onAudioTap {
    NSLog(@"onAudioTap ... ");
    
    if (self.audioImageView.isAnimating) {
        [self.audioImageView stopAnimating];
    }
    else {
        [self.audioImageView startAnimating];
    }
    
}

# pragma Getter & Setter

-(UIImageView *)audioImageView {
    
    if (!_audioImageView) {
        _audioImageView = [[UIImageView alloc] init];
        _audioImageView.image = [UIImage imageNamed:@"MessageVoiceInPlayFrame03"];
        _audioImageView.animationImages = [self.imageMutableArray copy];
        _audioImageView.animationDuration = 0.8;
    }
    return _audioImageView;
}

-(UILabel *)lengthLabel {
    if (!_lengthLabel) {
        _lengthLabel = [[UILabel alloc] init];
        _lengthLabel.textColor = [UIColor grayColor];
        _lengthLabel.font = [UIFont systemFontOfSize:12];
    }
    return _lengthLabel;
}

-(NSMutableArray *)imageMutableArray {
    if (!_imageMutableArray) {
        _imageMutableArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"MessageVoiceInPlayFrame01"], [UIImage imageNamed:@"MessageVoiceInPlayFrame02"], [UIImage imageNamed:@"MessageVoiceInPlayFrame03"], [UIImage imageNamed:@"MessageVoiceInPlayFrame02"], [UIImage imageNamed:@"MessageVoiceInPlayFrame01"], nil];
    }
    return _imageMutableArray;
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
