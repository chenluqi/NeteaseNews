//
//  PlayOtherModel.h
//  项目三
//
//  Created by MAC104 on 16/5/30.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayOtherModel : NSObject


//videoPlay单元格页面
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *mp4_url;
@property (nonatomic, assign) NSInteger playcount;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *topicImg;
@property (nonatomic, copy) NSString *topicName;

@end
