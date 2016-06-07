//
//  RelayViewController.m
//  项目三
//
//  Created by MAC104 on 16/5/27.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "RelayViewController.h"
#import "UIViewExt.h"
#import "VideoPlayViewController.h"
#import "BarrageView.h"

@interface RelayViewController ()

@end

@implementation RelayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showkeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self _createRelayViews];
    
}

- (void)_createRelayViews {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight / 3, kScreenWidth, kScreenHeight / 3)];
    imageView.backgroundColor = [UIColor colorWithRed:231 / 255.0 green:231 / 255.0 blue:231 / 255.0 alpha:0.5];
    imageView.userInteractionEnabled = YES;
    
    
    [self.view addSubview:imageView];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(20, 10, 40, 30);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [imageView addSubview:cancelButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - 100) / 2, 10, 100, 40)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:17];
    label.text = @"发弹幕跟帖";
    label.textAlignment = NSTextAlignmentCenter;
    
    [imageView addSubview:label];
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.frame = CGRectMake(kScreenWidth - 60, 10, 40, 30);
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(sendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [imageView addSubview:sendButton];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(cancelButton.left + 10, label.bottom + 10, imageView.width - 60, imageView.height - label.height - 40)];
    [imageView addSubview:_textView];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
    
    [_textView becomeFirstResponder];
}

- (void)cancelButtonAction {
    
    
    NSLog(@"取消按钮被点击");
    
    VideoPlayViewController *play = [[VideoPlayViewController alloc] init];
    play.barrageView.BarrageTextFiled.enabled = NO;

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendButtonAction {
    
    
}





- (void)showkeyBoard:(NSNotification *)noti {
    
    NSLog(@"%@",noti.userInfo);
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
