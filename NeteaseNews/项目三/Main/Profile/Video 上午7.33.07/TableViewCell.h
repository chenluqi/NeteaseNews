//
//  TableViewCell.h
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MediaViewCell.h"
#import "PlayOtherModel.h"
#import "PlayModel.h"
#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell


//推荐相关的单元格内容
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *SourceImg;
@property (weak, nonatomic) IBOutlet UILabel *SourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *CommentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playImg;
@property (weak, nonatomic) IBOutlet UILabel *PlayCount;





//跟帖相关的单元格设置
@property (weak, nonatomic) IBOutlet UIImageView *UserImg;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

//关注相关单元格设置
@property (weak, nonatomic) IBOutlet UIImageView *themeImg;
@property (weak, nonatomic) IBOutlet UILabel *themeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeSoruceLabel;
@property (weak, nonatomic) IBOutlet UIButton *themeAttentionButton;


@property (nonatomic, strong) PlayModel *model;
@property (nonatomic, strong) PlayOtherModel *otherModel;
@property (nonatomic, strong) MediaModel *mediaModel;


- (instancetype)initWithFrame:(CGRect)frame;

@end
