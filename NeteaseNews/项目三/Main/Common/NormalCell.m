//
//  NormalCell.m
//  项目三
//
//  Created by Chrismith on 16/5/25.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "NormalCell.h"
#import "UIImageView+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation NormalCell

- (void)awakeFromNib {
    
    _iconImageView.layer.cornerRadius = 3;
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

- (CGRect)getBoundsFromLabel:(UILabel *)label
{
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:16]
                                 };
    //1.根据正文内容来计算正文高度
    CGRect labelRect = [label.text boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:NULL];
    
//    NSLog(@"%f, %f, %f, %f", labelRect.origin.x, labelRect.origin.y, labelRect.size.width, labelRect.size.height);
    _commentsLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
    
    //根据高度来设定正文label的frame
//    self.weiboTextFrame = CGRectMake(kSpace, kCellOriginHeight + kSpace, kScreenWidth - 20, weiboTextHeight);
    
    return CGRectMake(label.frame.origin.x, label.frame.origin.y, labelRect.size.width, labelRect.size.height);
}
                                
-(UIImage*)scaleToSize:(CGSize)size sourceImage:(UIImage *)sourceImg
{
    CGFloat width = CGImageGetWidth(sourceImg.CGImage);
    CGFloat height = CGImageGetHeight(sourceImg.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [sourceImg drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
