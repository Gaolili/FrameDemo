//
//  PuperPopView.m
//  NavationDemo
//
//  Created by gaolili on 15/9/16.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "PuperPopView.h"




#define CELL_H 44
#define ARROW_FRAME CGRectMake(frame.origin.x, frame.origin.y, 23, 11)
#define TABLE_FRAME CGRectMake(0, 11, CGRectGetWidth(frame), CGRectGetHeight(frame))

@interface PuperPopView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray * dataArr;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIImageView * arrowImg;
@end

@implementation PuperPopView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = items;
        _arrowImg = [[UIImageView alloc]initWithFrame:ARROW_FRAME];
        _arrowImg.image = [UIImage imageNamed:@"options_pointer"];
        [self addSubview:_arrowImg];
        
        _tableView = [[UITableView alloc]initWithFrame:TABLE_FRAME style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        
        UIImageView * bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Menu_PopOver_BG"]];
        _tableView.backgroundView = bg;
        
        
        [self addSubview:_tableView];
        
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_H;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UIImageView * bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Menu_PopOver_BG"]];
        cell.backgroundView =bg;
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    [self hideViews];
    if ([self.delegate respondsToSelector:@selector(popViewClickAction:)]) {
        [self.delegate popViewClickAction:indexPath.row];
    }
}

- (void)showInViews{
    [self hideViews];
    [UIView animateWithDuration:0.35 animations:^{
        self.alpha = 1;
    }];
}


- (void)hideViews{
    [UIView animateWithDuration:0.35 animations:^{
        self.alpha = 0;
    }];
}
@end