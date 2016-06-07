//
//  CustonButton.h
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustonButton : UIButton

@property (nonatomic, strong) UIImageView *buttonImageView;
@property (nonatomic, strong) UILabel *buttonLabel;

- (instancetype)initWithFrame:(CGRect)frame buttonImageViewName:(NSString *)buttonImageViewName buttonLabelText:(NSString *)buttonLabelText;

@end
