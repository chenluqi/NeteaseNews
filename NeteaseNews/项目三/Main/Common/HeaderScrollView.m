//
//  HeaderScrollView.m
//  项目三
//
//  Created by Chrismith on 16/5/27.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "HeaderScrollView.h"
#import "UIImageView+WebCache.h"
#import "HeadImageViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HeaderScrollView () <UIScrollViewDelegate>

@end

@implementation HeaderScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //配置头视图中的表视图
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)setModel:(NormalCellModel *)model
{
    if (model != _model) {
        _model = model;
        
        self.contentSize = CGSizeMake(kScreenWidth * (model.adsArr.count + 1), 0);
        
        for (NSInteger i = 0; i < model.adsArr.count + 1; i++) {
            UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, 200)];
            headerImgView.contentMode = UIViewContentModeScaleAspectFill;
            headerImgView.clipsToBounds = YES;
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 200 - 30, kScreenWidth - 100, 30)];
            titleLabel.textColor = [UIColor whiteColor];
    
            if (i < model.adsArr.count) {
                [headerImgView sd_setImageWithURL:[NSURL URLWithString:model.adsArr[i][@"imgsrc"]]];
                titleLabel.text = model.adsArr[i][@"title"];
            } else {
                [headerImgView sd_setImageWithURL:[NSURL URLWithString:model.adsArr[0][@"imgsrc"]]];
                titleLabel.text = model.adsArr[0][@"title"];
            }
            
            [headerImgView addSubview:titleLabel];
            
            [self addSubview:headerImgView];
        }
    }
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self];
    
    NSInteger num = location.x / kScreenWidth;
    NSLog(@"%li", num);
    
    HeadImageViewController *headVC = [[HeadImageViewController alloc] init];
    
    headVC.url = num == 5 ? _model.adsArr[1][@"url"] : _model.adsArr[num][@"url"];
    
    UIViewController *viewCtrl = [self viewController];
    [viewCtrl.navigationController pushViewController:headVC animated:YES];
    

}





@end
