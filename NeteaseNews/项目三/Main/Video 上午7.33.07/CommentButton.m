//
//  CommentButton.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "CommentButton.h"

#define itemSize 60
#define buttonSize 40

@implementation CommentButton



- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self _createData];
        [self _createSubViews];
    }
    
    return self;
}


- (void)_createData {
    
    _item2D = [NSMutableArray array];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"buttonplist" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSLog(@"%@",array);
    
    //确定行列和页数
    
    NSMutableArray *item1D = nil;
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        if (item1D == nil || item1D.count == 8) {
            
            item1D = [NSMutableArray arrayWithCapacity:8];
            [_item2D addObject:item1D];
        }
        [item1D addObject:array[i]];
    }
    
}

- (void)_createSubViews {
    

    
    for (NSInteger i = 0; i < _item2D.count; i++) {
        
        NSArray *item1D = _item2D[i];
        
        for (NSInteger j = 0; j < item1D.count; j++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            CGFloat x = i * self.frame.size.width + j % 4 * 80;
            CGFloat y = j / 4 * 90;
            
            button.frame = CGRectMake(x, y, 80, 60);
            [button setImage:[UIImage imageNamed:item1D[j][@"imageName"]] forState:UIControlStateNormal];
            button.tag = i * 8 + j;
            [button addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y + 60, 80, 30)];
            label.text = item1D[j][@"text"];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:12];
            
            [self addSubview:label];
            
            
        }
        
    }
    
    
}


- (void)shareAction:(UIButton *)button {
    
    NSLog(@"现在点击的事第几个按钮:%li",button.tag);
}




@end
