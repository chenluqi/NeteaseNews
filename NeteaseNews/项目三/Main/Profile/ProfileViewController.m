//
//  ProfileViewController.m
//  项目三
//
//  Created by 季乾丰大帅哥！！！ on 16/5/29.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "ProfileViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ProfileViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width0;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width3;

@property (nonatomic, strong) UIView *headerView;

@end

@implementation ProfileViewController

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        _headerView.backgroundColor = [UIColor colorWithRed:(232 / 255.0) green:(67 / 255.0) blue:(67 / 255.0) alpha:1];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
}

- (void)initLayout{
    CGFloat width = (kScreenWidth - 3) / 4;
    self.width0.constant = width;
    self.width1.constant = width;
    self.width2.constant = width;
    self.width3.constant = width;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark-*****UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark-*****ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%lf",scrollView.contentOffset.y);
    CGFloat yOffSet = scrollView.contentOffset.y;
    CGFloat width = kScreenWidth;
    if (yOffSet < 0) {
        self.headerView.frame = CGRectMake(0, yOffSet, width, -yOffSet);
    }else{
         self.headerView.frame = CGRectMake(0, 0, width, 0);
    }
    
}



@end
