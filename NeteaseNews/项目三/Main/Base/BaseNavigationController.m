//
//  BaseNavigationController.m
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "BaseNavigationController.h"

#define kThemeChangeNotification @"kThemeChangeNotification"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeChangeNotification object:nil];
}

//xib，代码创建controller会调用
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    //alloc init--->initWithNibName:bundle:
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.navigationBar.translucent = YES;
        [self _observeThemeChangeNotification];
        
    }
    
    return self;
    
}

//storyboard创建controller会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        //配置导航栏
        self.navigationBar.translucent = YES;
        self.navigationBar.barTintColor = [UIColor colorWithRed:(232 / 255.0) green:(35 / 255.0) blue:(35 / 255.0) alpha:1];
        
        //设置标题颜色和字体大小等
        NSDictionary *dic = @{
                              NSFontAttributeName    : [UIFont boldSystemFontOfSize:20]
                              , NSForegroundColorAttributeName : [UIColor whiteColor]
                              };
        
        [self.navigationBar setTitleTextAttributes:dic];
        [self _observeThemeChangeNotification];
    }
    
    return self;
}

//封装监听通知的方法
- (void)_observeThemeChangeNotification {
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadImage) name:kThemeChangeNotification object:nil];
    
    
}

//设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)loadImage {
    
   
//    [self.navigationBar setBackgroundColor:[UIColor redColor]];
    
    //更改导航栏标题字体颜色 iOS5.0之后可用
//    UIColor *titleColor = [[ThemeManager sharedManager] themeColorWithColorName:@"Mask_Title_color"];
//    
//    NSDictionary *titleAttributes = @{
//                                      NSForegroundColorAttributeName : titleColor
//                                      
//                                      };
//    self.navigationBar.titleTextAttributes = titleAttributes;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.alpha = 1;
    
    [self loadImage];
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
