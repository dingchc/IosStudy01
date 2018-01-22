//
//  ConfigTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 10/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import "ConfigTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation ConfigTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if (self) {
        self.iconImageView = [[UIImageView alloc]  init];
        self.titleLabel = [[UILabel alloc]  init];
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@16);
            make.width.equalTo(@40);
            make.height.equalTo(@40);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.right.equalTo(@16);
            make.height.equalTo(@32);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

-(void)remake {
    
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
        make.centerY.equalTo(self.contentView);
    }];
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
