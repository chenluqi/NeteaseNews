//
//  CommentView.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "CommentView.h"
#import "CommentViewController.h"
#import "UIViewExt.h"

@implementation CommentView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self _createSubViews];
        
    }
    
    return self;
}


- (void)_createSubViews {
    
    self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 20)];
    self.commentLabel.text = @"分享领红包";
    self.commentLabel.textColor = [UIColor redColor];
    self.commentLabel.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:self.commentLabel];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.commentLabel.right + 2, self.commentLabel.top, 30, 30)];
    self.imageView.image = [UIImage imageNamed:@""];

    [self addSubview:self.imageView];
    
    self.buttonSrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(15, self.imageView.bottom + 10, self.frame.size.width - 30, 180)];
    self.buttonSrollView.backgroundColor = [UIColor whiteColor];
    self.buttonSrollView.contentSize = CGSizeMake(self.buttonSrollView.width * 2, self.buttonSrollView.height);
    self.buttonSrollView.pagingEnabled = YES;
    self.buttonSrollView.showsHorizontalScrollIndicator = NO;
    self.buttonSrollView.showsVerticalScrollIndicator = NO;
    
    self.buttonSrollView.delegate = self;
    [self addSubview:self.buttonSrollView];
    
    self.commentView = [[CommentButton alloc] initWithFrame:CGRectMake(0, 0, self.buttonSrollView.frame.size.width, self.buttonSrollView.height)];
    
    [self.buttonSrollView addSubview:self.commentView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.buttonSrollView.left, self.buttonSrollView.bottom, self.frame.size.width, 10)];
    self.pageControl.numberOfPages = 2;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.tintColor = [UIColor orangeColor];
    [self addSubview:self.pageControl];
    
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelButton setImage:[UIImage imageNamed:@"share_cancel_highlighted@2x"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.cancelButton.frame = CGRectMake((self.buttonSrollView.frame.size.width - 25) / 2, self.height - 60, 50, 50);
    
    [self addSubview:self.cancelButton];
    
    
}

- (UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;
    
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        } else {
            next = next.nextResponder;
            
        }
    }
    
    return nil;
}

- (void)cancelButtonAction {
    
    
    CommentViewController *comment = (CommentViewController *)[self viewController];
    [comment dismissViewControllerAnimated:YES completion:NULL];
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = self.buttonSrollView.contentOffset.x / self.buttonSrollView.width;
    
    NSLog(@"%li",self.pageControl.currentPage);
}


@end
