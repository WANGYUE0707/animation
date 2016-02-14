//
//  UIImage+Extension.h
//  zhixing
//
//  Created by wangyue on 15/12/30.
//  Copyright © 2015年 wangyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
// 剪切图片
+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect;
@end
