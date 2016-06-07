//
//  PlayTableView.m
//  项目三
//
//  Created by MAC104 on 16/5/28.
//  Copyright © 2016年 Chrismith. All rights reserved.
//

#import "PlayTableView.h"
#import "TableViewCell.h"

@implementation PlayTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
         _dataArr = [NSMutableArray array];
        _dataArray = [NSMutableArray array];
        self.delegate = self;
        self.dataSource = self;
       
        
        
        [self registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        
        [self registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"Kcell"];
        [self registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"KKcell"];
    }
    return self;
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    
    _dataArr = dataArr;
    
    
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    
    _dataArr = dataArray;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    } else if (section == 1) {
        
        return 1;
    } else if (section == 2) {
        
        return 5;
    } else if (section == 3) {
        
        return 3;
    }
    
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2 && indexPath.row > 0) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.otherModel = self.dataArr[indexPath.section - 1];
        
        return cell;
    } else if (indexPath.section == 0) {
        
        TableViewCell *cell = [[TableViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 90)];
        cell.model = [self.dataArray firstObject];
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, kScreenWidth - 80, 50)];
        
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.text = @"现在真的是开始慌了，毕不了业真的是好看了，连毕业照都拍来你让我毕不了业？";
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:17];
        
        [cell addSubview:titleLabel];
        
        UILabel *otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.left, titleLabel.bottom + 5, kScreenWidth - 100, 25)];
        otherLabel.text = @"好吧，我承认我喜欢你";
        otherLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:12];
        
        [cell addSubview:titleLabel];
        
        return cell;
        
    } else if (indexPath.section == 1  && indexPath.row >= 0) {
    
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Kcell" forIndexPath:indexPath];
        cell.otherModel = [self.dataArr firstObject];
        
        return cell;
        
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        
        TableViewCell *cell = [[TableViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kScreenWidth - 100, 20)];
        
        label.text = @"推荐";
        label.font = [UIFont systemFontOfSize:14];
        
        [cell addSubview:label];
        
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 0) {
        
        TableViewCell *cell = [[TableViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kScreenWidth - 100, 20)];
        
        label.text = @"跟帖";
        label.font = [UIFont systemFontOfSize:14];
        
        [cell addSubview:label];
        
        return cell;
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        return 90;
    } else if (indexPath.section == 1) {
        
        return 50;
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        
        return 50;
    } else if (indexPath.section == 2 && indexPath.row > 0) {
        
        return 90;
    } 
    
    return 90;
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}


@end
