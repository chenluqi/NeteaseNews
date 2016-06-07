//
//  MediaViewCell.m
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MediaViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "VideoPlayViewController.h"
#import "MediaView.h"
#import "RelayViewController.h"
#import "CommentViewController.h"

@implementation MediaViewCell

- (void)awakeFromNib {
    
    
    [super awakeFromNib];
    [self _createSubViews];
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self _createSubViews];
        
    }
    return self;
}

- (void)_createSubViews {
    
    self.sectionImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - 30)];
    
    [self addSubview:self.sectionImg];
    
    self.playButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.playButton.center = self.sectionImg.center;
    
    
    [self.sectionImg addSubview:self.playButton];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, self.width - 20, 50)];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.numberOfLines = 0;
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    style.lineBreakMode = NSLineBreakByClipping;
//    CGRect rect3 = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.width - 20, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{
//                                                                                                                                             NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//                                                                                                                                        
//                                                                                                                                             NSParagraphStyleAttributeName : style
//                                                                                                                                             } context:nil];

    
//    self.titleLabel.frame = CGRectMake(10, 5, self.width - 20, height);
    [self.sectionImg addSubview:self.titleLabel];
    
    self.countAndLengthLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width - 120, CGRectGetMaxY(self.sectionImg.frame) - 30, 120, 30)];
    self.countAndLengthLabel.textColor = [UIColor whiteColor];
    self.countAndLengthLabel.backgroundColor = [UIColor clearColor];
    self.countAndLengthLabel.font = [UIFont systemFontOfSize:12];
    self.sectionImg.userInteractionEnabled = YES;
    
    [self.sectionImg addSubview:self.countAndLengthLabel];

    
    self.topicImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.sectionImg.frame) + 5, self.sectionImg.bottom + 5, 20, 20)];
    self.topicName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.topicImg.frame) + 3, self.sectionImg.bottom + 5, 120, 20)];
    
    
    [self addSubview:self.topicImg];
    [self addSubview:self.topicName];
    
    self.relaybutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.relaybutton.frame = CGRectMake(self.width - 60, CGRectGetMaxY(self.sectionImg.frame) + 5, 20, 20);
    [self.relaybutton setImage:[UIImage imageNamed:@"night_video_list_cell_time@2x"] forState:UIControlStateNormal];
    [self.relaybutton addTarget:self action:@selector(relaybuttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.commentButton.frame = CGRectMake(CGRectGetMaxX(self.relaybutton.frame) + 10 , self.relaybutton.top, 20, 20);
    [self.commentButton setImage:[UIImage imageNamed:@"cell_share_icon@2x"] forState:UIControlStateNormal];

    [self.commentButton addTarget:self action:@selector(commentButtonAction) forControlEvents:UIControlEventTouchUpInside];

    
    [self addSubview:self.commentButton];
    [self addSubview:self.relaybutton];

    
}


- (void)setModel:(MediaModel *)model {
    
    _model = model;
    [self.sectionImg sd_setImageWithURL:[NSURL URLWithString:_model.sectiontitle]];
    self.sectionImg.contentMode = UIViewContentModeScaleAspectFill;
    self.sectionImg.clipsToBounds = YES;
    
    self.playButton.image = [UIImage imageNamed:@"night_video_list_cell_big_icon@2x"];
    
    self.titleLabel.text = _model.title;
    CGFloat length = _model.length / 60.00;
    CGFloat playCount = _model.playCount / 10000.00;
    self.countAndLengthLabel.text = [NSString stringWithFormat:@"%.2lf分钟/%.1lf万",length,playCount];
    
    [self.topicImg sd_setImageWithURL:[NSURL URLWithString:_model.topicImg]];
    self.topicName.text = _model.topicName;
    
    

    
}


- (void)relaybuttonAction {
    
    RelayViewController *play = [[RelayViewController alloc] init];
    
    UIViewController *viewCtrl = [self viewConroller];
    
    [viewCtrl.navigationController pushViewController:play animated:YES];
    
}

- (void)commentButtonAction {
    
    
    NSLog(@"到底有没有反应啊");
    
    CommentViewController *comment = [[CommentViewController alloc] init];
    UIViewController *viewCtrl = [self viewConroller];
    
    [viewCtrl presentViewController:comment animated:YES completion:NULL];
    
    
}



- (UIViewController *)viewConroller {
    
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
