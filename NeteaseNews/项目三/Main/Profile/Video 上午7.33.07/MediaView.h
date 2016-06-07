//
//  MediaView.h
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayViewController.h"



@interface MediaView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIWebViewDelegate>




@property (nonatomic,strong) NSMutableArray *dataArr;



- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end
