//
//  CALayer+Addtion.m
//  点点
//
//  Created by 吴玉铁 on 16/1/26.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import "CALayer+Addtion.h"
#import <objc/runtime.h>

@implementation CALayer (Addtion)

//static const void *borderColorFromUIColorKey = &borderColorFromUIColorKey;
//@dynamic borderColorFromUIColor;

- (UIColor *)borderColorFromUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

- (void)setBorderColorFromUIColor:(UIColor *)color{
    self.borderColor = color.CGColor;
}


@end
