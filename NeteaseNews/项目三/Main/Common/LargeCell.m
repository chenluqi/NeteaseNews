//
//  LargeCell.m
//  项目三
//
//  Created by Chrismith on 16/5/27.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "LargeCell.h"
#import "UIImageView+WebCache.h"

@implementation LargeCell

- (void)awakeFromNib {
    // Initialization code
    _iconImageView.layer.cornerRadius = 5;
}

- (void)setModel:(NormalCellModel *)model
{
    if (_model != model) {
        _model = model;
        
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_model.iconImageUrl]];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.clipsToBounds = YES;
        
        _titleLabel.text = _model.titleText;
        _sourceLabel.text = _model.sourceText;
        
        CGFloat count = [_model.commentsCount integerValue] / 10000;
        _commentsLabel.text = count < 1 ? [NSString stringWithFormat:@"%@", _model.commentsCount] : [NSString stringWithFormat:@"%.1f万跟帖", count];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
