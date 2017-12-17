//
//  TopicTableViewCell.m
//  IosStudy01
//
//  Created by Ding on 17/12/2017.
//  Copyright © 2017 ding. All rights reserved.
//

#import "TopicTableViewCell.h"

@implementation TopicTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 50, 50)];
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 200, 50)];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];

    }
    
    return self;
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
