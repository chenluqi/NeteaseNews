//
//  HeadImageViewController.m
//  项目三
//
//  Created by Chrismith on 16/6/5.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "HeadImageViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface HeadImageViewController ()
{
    NSMutableArray *_photoArr;
    BOOL _tapFlage;
}
@end

@implementation HeadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tapFlage = YES;
    
    [self configNavigationBar];
//    self.view.backgroundColor = [UIColor blackColor];
    self.tabBarController.tabBar.hidden = YES;
    
    NSRange range = NSMakeRange(9, 7);
    NSString *urlString = [_url substringWithRange:range];
    
    [self GETFromUrlString:[NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/0001/%@.json", urlString]];
    [self createUI];
    
}

- (void)GETFromUrlString:(NSString *)urlString {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        _photoArr = responseObject[@"photos"];
        [self createUI];

    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
}

- (void)configNavigationBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 42, 42);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"top_navigation_back@2x"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"top_navigation_back_highlighted@2x"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtton;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 28, 28);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"top_navigation_more@2x"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"top_navigation_highlighted_more@2x"] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)leftButtonAction:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)createUI
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.contentSize = CGSizeMake(kScreenWidth * _photoArr.count, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    for (NSInteger i = 0; i < _photoArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, (kScreenHeight - 250) / 2, kScreenWidth, 250)];
        [imageView sd_setImageWithURL:_photoArr[i][@"timgurl"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled= YES;
        imageView.tag = 100 + i;
        
        [scrollView addSubview:imageView];
        
        UITapGestureRecognizer *exitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:exitTap];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 500, kScreenWidth, 200)];
        
        textView.text = _photoArr[i][@"note"];
        textView.font = [UIFont systemFontOfSize:15];
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor whiteColor];
        
        [scrollView addSubview:textView];
    }
    
}

- (void)tapAction:(UIGestureRecognizer *)tap
{
    _tapFlage = !_tapFlage;
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self.navigationController.navigationBar.frame = _tapFlage ? CGRectMake(0, -64, kScreenWidth, 64) : CGRectMake(0, 0, kScreenWidth, 64);
    }];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(232 / 255.0) green:(35 / 255.0) blue:(35 / 255.0) alpha:1];
    
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
