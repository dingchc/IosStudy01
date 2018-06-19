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
#import "UIImage+Scale.h"

@interface MessageImageInputTableViewCell()


@end

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
        
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:entry.thumbUrl] placeholderImage:[UIImage imageNamed:@"Thumb_Placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            CGSize scaledSize = [self calculateScaledSizeWithOrigin:CGSizeMake(image.size.width, image.size.height)];
            
            UIImage * scaledImage = [image scaleToSize:scaledSize];
            self.contentImageView.image = scaledImage;

            [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {

                make.edges.equalTo(self.bubbleImageView).insets(UIEdgeInsetsMake(6.0, 13.0f, 6.0f, 6.0));
            }];
            
            // 设置高度，发送通知
            if (entry.imageSize.width <= 0.01) {
                entry.imageSize = CGSizeMake(image.size.width, image.size.height);
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_IMAGE_READY object:entry];
            }
        }];
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
