//
//  UIImage+Extension.m
//  zhixing
//
//  Created by wangyue on 15/12/30.
//  Copyright © 2015年 wangyue. All rights reserved.
//

#import "UIImage+Extension.h"
//#import <sys/sysctl.h>

@implementation UIImage (Extension)

+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect {
    
    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];
    CGImageRelease(refImage);
    return newImage;
}

@end
