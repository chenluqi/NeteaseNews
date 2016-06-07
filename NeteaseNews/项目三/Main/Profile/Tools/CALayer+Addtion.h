//
//  CALayer+Addtion.h
//  点点
//
//  Created by 吴玉铁 on 16/1/26.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Addtion)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
