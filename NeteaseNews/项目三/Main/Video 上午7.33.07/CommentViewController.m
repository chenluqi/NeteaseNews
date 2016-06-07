//
//  CommentViewController.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:.3 alpha:.4];
    
    
    
    self.commentView = [[CommentView alloc] initWithFrame:CGRectMake(30, 200, kScreenWidth - 60, 300)];
    
    self.commentView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.commentView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
