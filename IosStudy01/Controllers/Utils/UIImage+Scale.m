//
//  UIImage+Scale.m
//  IosStudy01
//
//  Created by Ding on 2018/6/13.
//  Copyright © 2018 ding. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage(Scale)

-(UIImage *)scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaleImage;
}

@end
