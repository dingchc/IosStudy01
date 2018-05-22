//
//  CustomView.m
//  IosStudy01
//
//  Created by Ding on 2018/5/16.
//  Copyright © 2018 ding. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor lightGrayColor] setFill];
    UIRectFill(rect);
    
    [[UIColor greenColor] setStroke];
    CGRect frame = CGRectMake(0, 64, 100, 200);
    UIRectFrame(frame);
    
    //绘制图片
    UIImage *image = [UIImage imageNamed:@"my_page_btn_bg"];
//    [image drawInRect:rect];
    [image drawAtPoint:CGPointMake(0, 64)];
    
    //写文字
    NSString *text = @"Hello World";
    UIFont *font = [UIFont systemFontOfSize:28];
    NSDictionary *attr = @{NSFontAttributeName:font};
    CGSize size = [text sizeWithAttributes:attr];
    
    NSLog(@"w = %f, h=%f", size.width, size.height);
    
    [text drawAtPoint:CGPointMake(50, 290) withAttributes:attr];
    
    // about Quartz
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 100, 124);
    CGContextAddLineToPoint(context, 150, 224);
    CGContextAddLineToPoint(context, 50, 224);
    CGContextClosePath(context);
    
    [[UIColor blackColor] setStroke];
    [[UIColor orangeColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -image.size.height);
    CGImageRef cgImage = image.CGImage;
    CGContextDrawImage(context, CGRectMake(0, 10, image.size.width, image.size.height), cgImage);
}

@end
