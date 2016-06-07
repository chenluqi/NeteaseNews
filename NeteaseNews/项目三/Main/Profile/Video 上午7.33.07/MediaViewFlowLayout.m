//
//  MediaViewFlowLayout.m
//  项目三
//
//  Created by MAC104 on 16/5/26.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "MediaViewFlowLayout.h"

@implementation MediaViewFlowLayout

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.itemSize = CGSizeMake(kScreenWidth, 200);
    }
    
    return self;
}

@end
