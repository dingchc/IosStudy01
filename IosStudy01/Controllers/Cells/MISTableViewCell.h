//
//  MISTableViewCell.h
//  EDU
//
//  Created by Maokebing on 3/9/16.
//  Copyright © 2016 Eduapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MISTableViewCell : UITableViewCell


/**
 *  复用标识
 *
 *  @return NSString obj
 */
+ (NSString *)reuseIdentifier;

/**
 *  更新Cell-子类实现
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj;

/**
 *  获取高度-子类实现
 *
 *  @param obj 指定obj
 *
 *  @return 高度
 */
+ (CGFloat )heightForCellWithObj:(id )obj;

/**
 *  添加子view-子类实现
 */
- (void)prepare;

/**
 *  设置布局-子类实现
 */
- (void)placeSubViews;


/**
 *  是否是最后一行的 cell. 方便子类实现 set 方法，控制底部的线
 */
@property (nonatomic) BOOL isLastRowCell;


/**
 *  底部线条
 */
@property (nonatomic, strong, readonly) UIView* bottomLine;

@end
