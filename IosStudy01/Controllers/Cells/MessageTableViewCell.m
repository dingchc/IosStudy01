//
//  MessageTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 2018/6/12.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

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

- (UIImageView *)bubbleImageView {
    if (!_bubbleImageView) {
        _bubbleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.senderNameLabel.frame.origin.x, 36, self.frame.size.width - AVATAR_DIMEN*2, 60)];
        _bubbleImageView.image = [[UIImage imageNamed:@"MessageBubbleInBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(7.5f, 15.0f, 7.5f, 15.0f)];
    }
    return _bubbleImageView;
}

-(CGSize) calculateScaledSizeWithOrigin:(CGSize) originSize {
    
    float widthRate = originSize.width / MAX_IMAGE_DIMEN;
    float heightRage = originSize.height / MAX_IMAGE_DIMEN;
    
    float max = MAX(widthRate, heightRage);
    
    float scaledWidth = originSize.width / max;
    float scaledHeight = originSize.height / max;
    
    return CGSizeMake(scaledWidth, scaledHeight);
}

@end
