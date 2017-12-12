//
//  MyTableViewCell.m
//  IosStudy01
//
//  Created by ding on 7/26/17.
//  Copyright © 2017 ding. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 名称
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 300, 50)];
        
        // 头像
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.iconImageView];

    }
    
    return self;
}

@end


