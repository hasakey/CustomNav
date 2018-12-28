//
//  UIImage+colorToImg.h
//  NavTest
//
//  Created by 喂！ on 2018/12/11.
//  Copyright © 2018年 well. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (colorToImg)

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
