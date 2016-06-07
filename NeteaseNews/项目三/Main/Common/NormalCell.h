//
//  NormalCell.h
//  项目三
//
//  Created by Chrismith on 16/5/25.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalCellModel.h"

@interface NormalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;

@property (nonatomic, assign) NormalCellModel *model;

@end
