//
//  VideoViewController.m
//  项目三
//
//  Created by Chrismith on 16/5/16.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "VideoViewController.h"
#import "MediaView.h"
#import "MediaViewFlowLayout.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "MediaModel.h"
#import "WXRefresh.h"

@interface VideoViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) MediaView *collection;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = YES;

    
    [self _requestVideoData];
    
    MediaViewFlowLayout *layout = [[MediaViewFlowLayout alloc] init];
    _collection = [[MediaView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    _collection.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.view addSubview:_collection];
    
    self.title = @"视频";
    

    //监听上拉和下拉的事件
    [_collection addPullDownRefreshBlock:^{
        NSLog(@"下拉刷新");
        //请求最新的微博数据
        [self _loadNewWangyiData];
    }];
//    
//    [_collection addInfiniteScrollingWithActionHandler:^{
//        NSLog(@"上拉加载");
//        
//        [self _loadNextWangyiData];
//    }];
}

- (void)_loadNewWangyiData {
    

    [self _requestVideoData];
    
    [_collection reloadData];
    [_collection.pullToRefreshView stopAnimating];
    
}

- (void)_loadNextWangyiData {
    
//    _dataArr = [NSMutableArray array];
//    [self _requestVideoData];
//    [_collection.infiniteScrollingView stopAnimating];
    
}




//请求网络数据
- (void)_requestVideoData {
    
    
    NSString *urlStr = @"http://c.3g.163.com/recommend/getChanListNews?channel=T1457068979049&passport=hgz7DdkVubWTTYi8QP18iYHneQ4Vgz8zRIWyqxFlJl4%3D&devId=wZf67Jr6jmfyFCoCF9vH0rHqOed0pdJ3v3lt1AmHd%2BygkJYqkGobMaBJNIbNmus5&size=10&version=9.0&spever=false&net=wifi&lat=&lon=&ts=1464244774&sign=BNaY6lIMWiNun9TE6MQD0Zx6AD7JYSAo36mfEVSOjZN48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        _collection.dataArr = [self addNewModel:responseObject];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
    
}


- (NSMutableArray *)addNewModel:(NSDictionary *)dic {
    
    NSMutableArray *tempArr = [_dataArr mutableCopy];
    NSArray *array = dic[@"视频"];
    
    _dataArr = [NSMutableArray array];
    
    
    
        
        for (NSDictionary *dic in array) {
            
            MediaModel *newmodel = [MediaModel yy_modelWithDictionary:dic];
            [_dataArr addObject:newmodel];
            
        }
        
        for (MediaModel *model in tempArr) {
            
            
                [_dataArr addObject:model];
            
            
        }
    
    
    //去除重复的单元格
    for (NSInteger i = 0; i < tempArr.count; i++) {
        if ([_dataArr[i] isEqual:tempArr[i]]) {
            
            [_dataArr removeObject:_dataArr[i]];
        }
    }
    
    
    return _dataArr;
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
