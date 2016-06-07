//
//  BarrageView.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "BarrageView.h"
#import "VideoPlayViewController.h"
#import "RelayViewController.h"

@implementation BarrageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _BarrageTextFiled.placeholder = @"发弹幕跟帖";
        _BarrageImg.backgroundColor = [UIColor purpleColor];
        _commentLabel.text = @"跟帖";
        _CommentButton.backgroundColor = [UIColor yellowColor];
    }
    
    return self;
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    _BarrageTextFiled.placeholder = @"发弹幕跟帖";
    
    [_BarrageTextFiled addTarget:self action:@selector(editingAction) forControlEvents:UIControlEventEditingDidBegin];
    _BarrageImg.backgroundColor = [UIColor purpleColor];
    _commentLabel.text = @"跟帖";
    _CommentButton.backgroundColor = [UIColor yellowColor];
}

- (UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;
    
    while (next != nil) {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        } else  {
            
            next = next.nextResponder;
        }
    }
    
    return nil;
}

- (void)editingAction {
    
    VideoPlayViewController *play = (VideoPlayViewController *)[self viewController];
    RelayViewController *relay = [[RelayViewController alloc] init];

    [play.navigationController pushViewController:relay animated:YES];
    
    
    
}


@end
