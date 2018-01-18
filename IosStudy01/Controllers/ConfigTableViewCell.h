//
//  ConfigTableViewCell.h
//  IosStudy01
//
//  Created by Ding on 10/01/2018.
//  Copyright © 2018 ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigTableViewCell : UITableViewCell
@property(nonatomic, strong) UIImageView* iconImageView;
@property(nonatomic, strong) UILabel* titleLabel;

-(void)remake;
@end
