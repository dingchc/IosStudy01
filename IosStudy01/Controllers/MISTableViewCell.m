//
//  MISTableViewCell.m
//  EDU
//
//  Created by Maokebing on 3/9/16.
//  Copyright © 2016 Eduapp. All rights reserved.
//

#import "MISTableViewCell.h"

static NSMutableDictionary* sharedCellInfo = nil;

@interface MISTableViewCell()
@property (nonatomic, strong) UIView* bottomLine;
@end

@implementation MISTableViewCell

+ (void)initialize {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedCellInfo = [NSMutableDictionary dictionary];
	});
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self prepare];
		
		[self placeSubViews];
	}
	return self;
}

- (void)prepare {
	//for subclass
}

- (void)placeSubViews {
	//for subclass
}

/**
 *  更新Cell
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj {
	//For subclass
}

/**
 *  获取高度-子类定高的要复写
 *
 *  @param obj 指定obj
 *
 *  @return 高度
 */
+ (CGFloat )heightForCellWithObj:(id )obj {
	MISTableViewCell* cell = [self sharedLayoutCell];
	[cell updateCellWithObj:obj];
	
	return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f;
}

/**
 *  重写复用
 */
- (void)prepareForReuse {
	[super prepareForReuse];
	
	self.isLastRowCell = NO;
}

/**
 *  子类实现-
 *
 *  @param isLastRowCell 最后一行
 */
- (void)setIsLastRowCell:(BOOL)isLastRowCell {
	
	//控制底线的显示与隐藏-子类可改写
	self.bottomLine.hidden = isLastRowCell;
	
	//For subclass
}

/**
 *  获取共享的布局cell
 *
 *  @return obj
 */
+ (id )sharedLayoutCell {
	@synchronized(self) {
		MISTableViewCell* sharedCell = [sharedCellInfo objectForKey:NSStringFromClass([self class])];
		
		if (!sharedCell) {
			sharedCell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
			sharedCellInfo[NSStringFromClass([self class])] = sharedCell;
		}
		return sharedCell;
	}
}

/**
 *  复用标识
 *
 *  @return NSString obj
 */
+ (NSString *)reuseIdentifier {
	//For subclass
	return [NSString stringWithFormat:@"%@ReuseIdentifier", NSStringFromClass([self class])];
}


#pragma mark - Getter

- (UIView *)bottomLine {
	if (!_bottomLine) {
		_bottomLine = [[UIView alloc] init];
		_bottomLine.backgroundColor = [UIColor lightGrayColor];
	}
	return _bottomLine;
}

@end
