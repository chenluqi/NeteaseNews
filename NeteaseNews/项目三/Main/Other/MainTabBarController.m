//
//  MainTabBarController.m
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MainTabBarController.h"
#import "CustonButton.h"

@interface MainTabBarController ()
{
    NSArray *_buttonNameArr;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.alpha = 1;
    self.tabBar.translucent = NO;
    
    //加载各导航控制器
    [self _loadSubViewCtrls];
    
    //自定义tabBar
    [self _createCustomTabBar];
}

- (void)_loadSubViewCtrls {
    
    NSArray *storyboardNames = @[@"Home", @"Read", @"Video", @"Topic", @"Profile"];
    
    NSMutableArray *navs = [NSMutableArray array];
    
    for (NSString *name in storyboardNames) {
        
        //获取到故事板
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        //加载故事板中的导航控制器--initial Controller
        UINavigationController *nav = [storyBoard instantiateInitialViewController];
        
        [navs addObject:nav];
        
    }
    //将导航控制器交给标签控制器管理
    self.viewControllers = navs;
    
}

- (void)_createCustomTabBar {
    
    //移除系统自带的tabBar按钮
    for (UIView *view in self.tabBar.subviews) {
        
        //NSLog(@"%@", view);
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
            
        }
        
    }
    
    CGFloat width = kScreenWidth / 5;
    
    _buttonNameArr = @[@"tabbar_icon_news_",
                       @"tabbar_icon_found_",
                       @"tabbar_icon_media_",
                       @"tabbar_icon_bar_",
                       @"tabbar_icon_me_"];
    NSArray *buttonText = @[@"新闻", @"阅读", @"视频", @"话题", @"我"];
    //添加自定义按钮
    for (NSInteger i = 0; i < 5; i++) {
        
        NSString *status = i == 0 ? @"highlight" : @"normal";
        CustonButton *button = [[CustonButton alloc] initWithFrame:CGRectMake(i * width, 0, width, kTabbarHeight) buttonImageViewName:[NSString stringWithFormat:@"%@%@@2x", _buttonNameArr[i], status] buttonLabelText:buttonText[i]];
        button.buttonLabel.textColor = i == 0 ? [UIColor redColor] : [UIColor blackColor];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = i + 500;
        
//        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@normal@2x", buttonNameArr[i]]] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@highlight@2x", buttonNameArr[i]] ] forState:UIControlStateHighlighted];
        
        [self.tabBar addSubview:button];
        
    }
    
//    //tabBar背景图片
//    ThemeImageView *backImageView = [[ThemeImageView alloc] initWithFrame:self.tabBar.bounds];
//    backImageView.imgName = @"mask_navbar.png";
//    
//    [self.tabBar insertSubview:backImageView atIndex:0];
//    
//    
//    
//    //选中图片
//    _selectImage = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, width, kTabbarHeight)];
//    _selectImage.imgName = @"home_bottom_tab_arrow.png";
//    
//    [self.tabBar addSubview:_selectImage];
    
    
}

- (void)clickButton:(UIButton *)sender {
    
    self.selectedIndex = sender.tag - 500;
    
    
    for (NSInteger i = 0 + 500; i < 505; i++) {
        
        CustonButton *button = [self.tabBar viewWithTag:i];
        UILabel *label = [button viewWithTag:1001];
        UIImageView *imageView = [button viewWithTag:1000];
        
        if (button.tag == sender.tag) {
            
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@highlight@2x", _buttonNameArr[button.tag - 500]]];
            label.textColor = [UIColor redColor];
        } else {
            label.textColor = [UIColor blackColor];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@normal@2x", _buttonNameArr[button.tag - 500]]];
        }
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
