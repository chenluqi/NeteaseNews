//
//  MediaModel.h
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sectiontitle;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, copy) NSString *topicImg;
@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *topicDesc;
@end
