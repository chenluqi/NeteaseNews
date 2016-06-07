//
//  BarrageView.h
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarrageView : UIView
@property (weak, nonatomic) IBOutlet UITextField *BarrageTextFiled;
@property (weak, nonatomic) IBOutlet UIImageView *BarrageImg;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *CommentButton;

- (instancetype)initWithFrame:(CGRect)frame;


@end
