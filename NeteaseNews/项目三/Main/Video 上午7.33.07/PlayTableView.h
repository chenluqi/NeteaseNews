//
//  PlayTableView.h
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
