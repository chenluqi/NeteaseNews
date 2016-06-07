//
//  CommentView.h
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "CommentButton.h"
#import <UIKit/UIKit.h>

@interface CommentView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *buttonSrollView;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) CommentButton *commentView;


- (instancetype)initWithFrame:(CGRect)frame;

@end
