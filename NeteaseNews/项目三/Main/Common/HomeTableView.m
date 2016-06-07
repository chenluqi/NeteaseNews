//
//  HomeTableView.m
//  项目三
//
//  Created by Chrismith on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "HomeTableView.h"
#import "NormalCell.h"
#import "PhotoCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "HeaderScrollView.h"
#import "NewsDetailViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HomeTableView () <UITableViewDataSource, UITableViewDelegate>
{
    UIPageControl *_pageCtrl;
//    UIScrollView *_headerScrollView;
    HeaderScrollView *_headerScrollView;
    NormalCellModel *_firstModel;
}
@end

@implementation HomeTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dataSource = self;
    self.delegate = self;
    
    [self registerNib:[UINib nibWithNibName:@"NormalCell" bundle:nil] forCellReuseIdentifier:@"NormalCell"];
    [self registerNib:[UINib nibWithNibName:@"PhotoCollectionCell" bundle:nil] forCellReuseIdentifier:@"PhotoCollectionCell"];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerNib:[UINib nibWithNibName:@"NormalCell" bundle:nil] forCellReuseIdentifier:@"NormalCell"];
        [self registerNib:[UINib nibWithNibName:@"PhotoCollectionCell" bundle:nil] forCellReuseIdentifier:@"PhotoCollectionCell"];
        [self registerNib:[UINib nibWithNibName:@"LargeCell" bundle:nil] forCellReuseIdentifier:@"LargeCell"];
    }
    return self;
}


- (void)setModelArr:(NSMutableArray *)modelArr
{
    _modelArr = modelArr;
    
    [self reloadData];
    [_timer invalidate];
}

//配置主表视图
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArr.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellReuseIdentifier = nil;
    NormalCellModel *model = _modelArr[indexPath.row + 1];
    
    if ([model.imgType integerValue] == 0) {
        
        if (model.imgnewextraArr.count != 0) {
            cellReuseIdentifier = @"PhotoCollectionCell";
            PhotoCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
            
            cell.model = _modelArr[indexPath.row + 1];
            
            cell.commentsLabel.backgroundColor = [UIColor clearColor];
            cell.commentsLabel.textColor = [UIColor grayColor];
            
            if ([cell.commentsLabel.text isEqualToString:@"置顶"]) {
                
                cell.commentsLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
                cell.commentsLabel.textColor = [UIColor blueColor];
            }
            
            return cell;
            
        } else {
            cellReuseIdentifier = @"NormalCell";
            NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
            
            cell.model = _modelArr[indexPath.row + 1];
            
            cell.commentsLabel.backgroundColor = [UIColor clearColor];
            cell.commentsLabel.textColor = [UIColor grayColor];
            
            if ([cell.commentsLabel.text isEqualToString:@"置顶"]) {
                
                cell.commentsLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
                cell.commentsLabel.textColor = [UIColor blueColor];
            }
            
            return cell;
            
        }
    } else {
        
        cellReuseIdentifier = @"LargeCell";
        NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
        
        cell.model = _modelArr[indexPath.row + 1];
        
        cell.commentsLabel.backgroundColor = [UIColor clearColor];
        cell.commentsLabel.textColor = [UIColor grayColor];
        
        if ([cell.commentsLabel.text isEqualToString:@"置顶"]) {
            
            cell.commentsLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
            cell.commentsLabel.textColor = [UIColor blueColor];
        }
        
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NormalCellModel *model = _modelArr[indexPath.row + 1];
    
    //如果imgType为0，且imgnewextraArr为空，选择normarCell...
    if ([model.imgType integerValue] == 0) {
        if (model.imgnewextraArr.count != 0) {
            return 150;
        }
        return 100;
    }
    return 200;
}

//表视图头视图的创建
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    [_timer invalidate];
    _firstModel = [[NormalCellModel alloc] init];
    _firstModel = [_modelArr firstObject];
    
    _headerScrollView = [[HeaderScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    _headerScrollView.model = _firstModel;
    _headerScrollView.delegate = self;

    //设置pageCtrl
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenWidth - 100, _headerScrollView.frame.size.height - 30, 100, 30)];
    _pageCtrl.backgroundColor = [UIColor clearColor];
    _pageCtrl.numberOfPages = _firstModel.adsArr.count;
    _pageCtrl.currentPage = 0;
    _pageCtrl.userInteractionEnabled = NO;
    [self addSubview:_pageCtrl];
    
    //开启自动翻页
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    return _headerScrollView;
}

- (void)timerAction
{
    CGPoint offset = CGPointMake(_headerScrollView.contentOffset.x, _headerScrollView.contentOffset.y);
    [UIView animateWithDuration:0.5 animations:^{
        _headerScrollView.contentOffset = CGPointMake(offset.x + kScreenWidth, offset.y);
        
    }];
    
    [self scrollViewDidEndDecelerating:_headerScrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [_timer invalidate];
    
    NSInteger page = _headerScrollView.contentOffset.x / kScreenWidth;
    
    if (page >= _firstModel.adsArr.count + 1) {
        
        _headerScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = _headerScrollView.contentOffset.x / kScreenWidth;
    
    _pageCtrl.currentPage = page < _firstModel.adsArr.count ? page : 0;
    
}

//头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 200;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NormalCellModel *model = _modelArr[indexPath.row + 1];
    NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
    newsDetailVC.urlString = model.urlString;
    newsDetailVC.titleText = model.titleText;
    
    if (newsDetailVC.urlString.length != 16) {
        newsDetailVC.urlString = @"BOPUQGG80001544E";
    }
    UIViewController *viewCtrl = [self viewController];
    [viewCtrl.navigationController pushViewController:newsDetailVC animated:YES];
}

@end
