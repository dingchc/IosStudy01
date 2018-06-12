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

+(NSString *)myTag {
    return @"tag_message";
}

@end
