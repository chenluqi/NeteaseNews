//
//  MediaView.m
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MediaView.h"
#import "MediaViewCell.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "BaseNavigationController.h"



@interface MediaView ()



@end


@implementation MediaView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        
        self.backgroundColor = [UIColor lightGrayColor];
        _dataArr = [NSMutableArray array];
        self.dataSource = self;
        self.delegate = self;
    
       
        [self registerClass:[MediaViewCell class] forCellWithReuseIdentifier:@"MediaID"];
    }
    return self;
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    
    _dataArr = dataArr;
    [self reloadData];

}


#pragma mark - datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MediaViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MediaID" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[MediaViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 280)];

    }
    
    cell.model = _dataArr[indexPath.row];
   
    return cell;
    
}

#pragma  mark - delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MediaViewCell *cell = (MediaViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

    
    VideoPlayViewController *play = [[VideoPlayViewController alloc] init];
    play.hidesBottomBarWhenPushed = YES;
    play.urlStr = cell.model.mp4_url;
    play.mediaCell = cell;
    
    NSLog(@"%@",play.urlStr);
    UIViewController *ViewCtrl =[self viewController];
    [ViewCtrl.navigationController pushViewController:play animated:YES];
   
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




@end
