//
//  NewsDetailViewController.h
//  项目三
//
//  Created by Chrismith on 16/5/27.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalCellModel.h"

@interface NewsDetailViewController : UIViewController

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) NSString *titleText;

@property (nonatomic, strong) UITextView *textView;

@end
