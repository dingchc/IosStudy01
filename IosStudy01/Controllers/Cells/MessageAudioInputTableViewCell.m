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
}

-(void)placeSubViews {
    
    [super placeSubViews];
    
    [self.audioImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.senderNameLabel).offset(13);
        make.top.equalTo(self.bubbleImageView).offset(6);
        make.width.equalTo(@AUDIO_DIMEN);
        make.height.equalTo(@AUDIO_DIMEN);
    }];
}

-(void)updateCellWithObj:(id)obj {
    
    if (obj) {
        
        MessageEntry * entry = obj;
        // use sd webimage
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:entry.avatarUrl] placeholderImage:[UIImage imageNamed:@"Avatar_default_medium"]];
        
        self.senderNameLabel.text = entry.senderName;
        
        [self.bubbleImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            int audioWidth = AUDIO_DIMEN + 13 + 6;
            int audioHeight = AUDIO_DIMEN + 6 + 6;
            make.width.equalTo(@(audioWidth));
            make.height.equalTo(@(audioHeight));
        }];
    }
}

# pragma Getter & Setter

-(UIImageView *)audioImageView {
    
    if (!_audioImageView) {
        _audioImageView = [[UIImageView alloc] init];
        _audioImageView.image = [UIImage imageNamed:@"MessageVoiceInPlayFrame03"];
    }
    return _audioImageView;
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
