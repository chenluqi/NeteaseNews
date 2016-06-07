//
//  PhotoCollectionCell.m
//  项目三
//
//  Created by Chrismith on 16/5/27.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "PhotoCollectionCell.h"
#import "UIImageView+WebCache.h"

@implementation PhotoCollectionCell

- (void)awakeFromNib {
    // Initialization code
    _imgView1.layer.cornerRadius = 4;
    _imgView2.layer.cornerRadius = 4;
    _imgView3.layer.cornerRadius = 4;
}

- (void)setModel:(NormalCellModel *)model
{
    if (_model != model) {
        _model = model;
        [_imgView1 sd_setImageWithURL:[NSURL URLWithString:_model.imgnewextraArr[0]]];
        _imgView1.contentMode = UIViewContentModeScaleAspectFill;
        _imgView1.clipsToBounds = YES;
        
        [_imgView2 sd_setImageWithURL:[NSURL URLWithString:_model.imgnewextraArr[1]]];
        _imgView2.contentMode = UIViewContentModeScaleAspectFill;
        _imgView2.clipsToBounds = YES;
        
        [_imgView3 sd_setImageWithURL:[NSURL URLWithString:_model.imgnewextraArr[2]]];
        _imgView3.contentMode = UIViewContentModeScaleAspectFill;
        _imgView3.clipsToBounds = YES;
        
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
