//
//  TableViewCell.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self _createVideoCellView];
    [self _createThemeCellView];
    [self _createCommentCellView];

}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self _createVideoCellView];
        [self _createThemeCellView];
        [self _createCommentCellView];
    }
    
    return self;
}


- (void)_createThemeCellView {
    
    
    [self.themeImg sd_setImageWithURL:[NSURL URLWithString:_model.topicImg]];
    self.themeSoruceLabel.text = _model.desc;
    self.themeSoruceLabel.text = self.mediaModel.title;
    [self.themeAttentionButton setImage:[UIImage imageNamed:@"icon_collect_highlight@2x"] forState:UIControlStateNormal];
}

- (void)_createVideoCellView {
    
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:_otherModel.cover]];
    self.TitleLabel.text = _otherModel.title;
    [self.SourceImg sd_setImageWithURL:[NSURL URLWithString:_otherModel.topicImg]];
    self.SourceLabel.text = _otherModel.topicName;
    self.CommentLabel.text = [NSString stringWithFormat:@"%li",_otherModel.replyCount];
 
}

- (void)_createCommentCellView {
    

    
}


- (void)setModel:(PlayModel *)model {
    
    _model = model;
    
    [self _createVideoCellView];
    [self _createThemeCellView];
    [self _createCommentCellView];
    
}

- (void)setOtherModel:(PlayOtherModel *)otherModel {
    
    
    _otherModel = otherModel;
    [self _createVideoCellView];
    [self _createThemeCellView];
    [self _createCommentCellView];
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
