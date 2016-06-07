//
//  MediaViewCell.h
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MediaModel.h"
#import <UIKit/UIKit.h>

typedef void(^videoBlock)(NSString *);

@interface MediaViewCell : UICollectionViewCell


@property (nonatomic, strong) UIImageView *sectionImg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *countAndLengthLabel;

@property (nonatomic, strong) UIImageView *topicImg;
@property (nonatomic, strong) UILabel *topicName;

@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *relaybutton;

@property (nonatomic, strong) UIImageView *playButton;


@property (nonatomic, copy) videoBlock playBlock;

@property (nonatomic, strong) MediaModel *model;





- (instancetype)initWithFrame:(CGRect)frame;


@end
