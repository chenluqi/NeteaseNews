//
//  VideoPlayViewController.h
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//
#import "PlayOtherModel.h"
#import "PlayModel.h"
#import "BarrageView.h"
#import <UIKit/UIKit.h>
@class MediaViewCell;

@interface VideoPlayViewController : UIViewController

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) MediaViewCell *mediaCell;

@property (nonatomic, strong) BarrageView *barrageView;

@property (nonatomic, copy) NSString *urlStr;


@property (nonatomic, strong) PlayModel *model;
@property (nonatomic, strong) PlayOtherModel *otherModel;
@end
