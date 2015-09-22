//
//  LeftTableView.m
//  NavationDemo
//
//  Created by gaolili on 15/9/21.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "LeftTableView.h"

@implementation LeftTableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate =self;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor grayColor];
        UIView * selView = [[UIView alloc]initWithFrame:cell.contentView.bounds];
        selView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView =selView;
     }
    cell.textLabel.text =self.leftDataArr[indexPath.row];
     return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.Leftdelegate respondsToSelector:@selector(LeftCellClick:)]) {
        [self.Leftdelegate LeftCellClick:indexPath];
    }
}
@end
