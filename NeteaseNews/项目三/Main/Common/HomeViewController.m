//
//  HomeViewController.m
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "HomeViewController.h"
#import "NormalCell.h"
#import "AFNetworking.h"
#import "NormalCellModel.h"
#import "UIImageView+WebCache.h"
#import "WXRefresh.h"
#import "HomeTableView.h"
#import "LXSegmentScrollView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HomeViewController ()
{
    NSMutableArray *_modelArr;
    HomeTableView *_homeTableView;
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"新闻";
    
    _modelArr = [NSMutableArray array];
    [self GETFromUrlString:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html?from=toutiao&fn=4&prog=LTitleA&passport=hgz7DdkVubWTTYi8QP18iYHneQ4Vgz8zRIWyqxFlJl4%3D&devId=wZf67Jr6jmfyFCoCF9vH0rHqOed0pdJ3v3lt1AmHd%2BygkJYqkGobMaBJNIbNmus5&size=20&version=9.0&spever=false&net=wifi&lat=&lon=&ts=1464145354&sign=akry8%2FDxU0zKuefzxOT7cY36NnuJ7vW2Sz%2BsG9iuQ2548ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"];
    
    [self createUI];
    
    
    //监听上拉和下拉的事件
    [_homeTableView addPullDownRefreshBlock:^{
        NSLog(@"下拉刷新");
        //请求最新的微博数据
        [self _loadNewWeiboData];
        
    }];
    
//    [_homeTableView addInfiniteScrollingWithActionHandler:^{
//        NSLog(@"上拉加载");
//        
//        [self _loadNextPageWeiboData];
//    }];
    
}

- (void)createUI
{
    NSMutableArray *array=[NSMutableArray array];
    
    _homeTableView = [[HomeTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    UIView *view1 = [[UIView alloc] init];
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [view1 addSubview:webview];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.apple.com/cn/"]];
    [webview loadRequest:request];
    view1.backgroundColor = [UIColor whiteColor];
    
    UITextView *view2 = [[UITextView alloc] initWithFrame:self.view.bounds];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    [array addObject:_homeTableView];
    [array addObject:view1];
    [array addObject:view2];
    
    LXSegmentScrollView *scView=[[LXSegmentScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) titleArray:@[@"头条",@"娱乐",@"热点"] contentViewArray:array];
    [self.view addSubview:scView];
}

//下拉刷新方法
- (void)_loadNewWeiboData {
    
    [self GETFromUrlString:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html?from=toutiao&fn=4&prog=LTitleA&passport=hgz7DdkVubWTTYi8QP18iYHneQ4Vgz8zRIWyqxFlJl4%3D&devId=wZf67Jr6jmfyFCoCF9vH0rHqOed0pdJ3v3lt1AmHd%2BygkJYqkGobMaBJNIbNmus5&size=20&version=9.0&spever=false&net=wifi&lat=&lon=&ts=1464145354&sign=akry8%2FDxU0zKuefzxOT7cY36NnuJ7vW2Sz%2BsG9iuQ2548ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"];
    
    [_homeTableView.pullToRefreshView stopAnimating];
    
}

//上拉加载方法
//- (void)_loadNextPageWeiboData{

//    [_homeTableView.infiniteScrollingView stopAnimating];
//    
//}

- (NSMutableArray *)addNewModel:(NSDictionary *)jsonDic
{
    NSArray *tempArr = [_modelArr copy];
    NSArray *array = jsonDic[@"T1348647853363"];
        
    _modelArr = [NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        NormalCellModel *model = [[NormalCellModel alloc] init];
        
        model.iconImageUrl = dic[@"img"];
        model.titleText = dic[@"title"];
        model.sourceText = [dic[@"recSource"] isEqualToString:@"#"] ? @"" : dic[@"recSource"];
        model.commentsCount = (NSNumber *)([dic[@"recSource"] isEqualToString:@"#"] ? @"置顶" : [NSString stringWithFormat:@"%@跟帖", dic[@"replyCount"]]);
        
        //添加头视图元素
        if ([dic objectForKey:@"ads"]) {
            model.adsArr = dic[@"ads"];
            
        }
        
        //添加头视图title
//        if ([dic objectForKey:@"ads"]) {
//            model.adsTitleArr = [
//        }
        
        //添加photoCell图片元素
        model.imgnewextraArr = [NSMutableArray array];
        if ([dic objectForKey:@"imgnewextra"]) {
            [model.imgnewextraArr addObject:dic[@"img"]];
            for (NSDictionary *imgUrlDic in dic[@"imgnewextra"]) {
                [model.imgnewextraArr addObject:imgUrlDic[@"imgsrc"]];
            }
        }
        //imgType类型
        model.imgType = dic[@"imgType"];
        
        //添加跳转url
        if ([dic objectForKey:@"docid"]) {
            model.urlString = dic[@"docid"];
            
        }
        
        [_modelArr addObject:model];
    }
    
    for (NormalCellModel *model in tempArr) {
        
        if ([(NSString *)(model.commentsCount) isEqualToString:@"置顶"]) {
            NSLog(@"%@", model.sourceText);
            continue;
        } else {
            [_modelArr addObject:model];
        }
        
    }
    NSLog(@"%li", _modelArr.count);
    
    return _modelArr;
}

- (void)GETFromUrlString:(NSString *)urlString {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {

        _homeTableView.modelArr = [self addNewModel:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败:%@", error);
    }];
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
