//
//  VideoPlayViewController.m
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "VideoPlayViewController.h"
#import "MediaViewCell.h"
#import "PlayTableView.h"
#import "BarrageView.h"
#import "AFNetworking.h"
#import "YYModel.h"


@interface VideoPlayViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) PlayTableView *playView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation VideoPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    self.dataArr = [NSMutableArray array];
    [self _loadData];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 300)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    
    [self.view addSubview:_webView];
    
    _playView = [[PlayTableView alloc] initWithFrame:CGRectMake(0, _webView.bottom, kScreenWidth, kScreenHeight - _webView.height - 50) style:UITableViewStyleGrouped];
    
//    self.barrageView = [[BarrageView alloc] initWithFrame:CGRectMake(0, playView.bottom, kScreenWidth, kScreenHeight - playView.height - _webView.height)];
    self.barrageView = [[[NSBundle mainBundle] loadNibNamed:@"Barrage" owner:self options:nil] lastObject];
    self.barrageView.frame = CGRectMake(0, _playView.bottom, kScreenWidth, kScreenHeight - _playView.height - _webView.height);
    
    
    [self.view addSubview:_playView];
    [self.view addSubview:self.barrageView];
    
    _playView.sectionHeaderHeight = 0.01;
    
}

- (void)_loadData {
    
    NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/detail/%@.html",self.mediaCell.model.vid];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.model = [PlayModel yy_modelWithDictionary:responseObject];
        NSLog(@"%@",self.model);
        
        [_dataArray addObject:self.model];
        NSArray *array = responseObject[@"recommend"];
        
        for (NSDictionary *dic in array) {
            self.otherModel = [PlayOtherModel yy_modelWithDictionary:dic];
            
            [_dataArr addObject:self.otherModel];
        }
        
        _playView.dataArr = _dataArr;
        _playView.dataArray = _dataArray;
        

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错%@",error);
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
