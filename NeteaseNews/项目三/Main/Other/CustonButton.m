//
//  CustonButton.m
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "CustonButton.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kImageViewHeight 21
#define kImageViewWidht 21
#define kLabelHeight 15
#define kLabelWidth 40

@implementation CustonButton

- (instancetype)initWithFrame:(CGRect)frame buttonImageViewName:(NSString *)buttonImageViewName buttonLabelText:(NSString *)buttonLabelText
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _buttonImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - kImageViewWidht) / 2, 5, kImageViewWidht, kImageViewHeight)];
        _buttonImageView.image = [UIImage imageNamed:buttonImageViewName];
        _buttonImageView.tag = 1000;
        
        _buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - kLabelWidth) / 2, CGRectGetMaxY(_buttonImageView.frame) + 5, kLabelWidth, kLabelHeight)];
        _buttonLabel.text = buttonLabelText;
        _buttonLabel.textAlignment = NSTextAlignmentCenter;
        _buttonLabel.font = [UIFont systemFontOfSize:10];
        _buttonLabel.tag = 1001;
        
        [self addSubview:_buttonLabel];
        [self addSubview:_buttonImageView];
    }
    
    return self;
}

@end
