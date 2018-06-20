//
//  MessageAudioOutputTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 2018/6/20.
//  Copyright © 2018 ding. All rights reserved.
//

#import "MessageOutputTableViewCell.h"
#import "MessageEntry.h"
#import "UIImageView+WebCache.h"

@interface MessageAudioOutputTableViewCell : MessageOutputTableViewCell

@property(nonatomic, strong) UIImageView *audioImageView;
@property(nonatomic, strong) UILabel *lengthLabel;
@property(nonatomic, copy) NSMutableArray *imageMutableArray;

@end
