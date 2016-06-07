//
//  NormalCellModel.h
//  项目三
//
//  Created by Chrismith on 16/5/25.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NormalCellModel : NSObject

//图片url
@property (nonatomic, copy) NSString *iconImageUrl;
//标题
@property (nonatomic, copy) NSString *titleText;
//来源
@property (nonatomic, copy) NSString *sourceText;
//评论数
@property (nonatomic, copy) NSNumber *commentsCount;
//头视图元素
@property (nonatomic, strong) NSArray *adsArr;
//图片类型（决定选择那种单元）
@property (nonatomic, copy) NSNumber *imgType;
//图集数组（决定使用普通还是三张图片的单元格）
@property (nonatomic, strong) NSMutableArray *imgnewextraArr;
//跳转url
@property (nonatomic, copy) NSString *urlString;


@end
