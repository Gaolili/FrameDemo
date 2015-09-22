//
//  RightTableViewController.m
//  NavationDemo
//
//  Created by gaolili on 15/9/21.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "RightTableView.h"
#import "CustomCell.h"
#import "UserModel.h"
#import "RightModel.h"
#import <MJRefresh.h>
@interface RightTableView ()
@property (nonatomic, assign)BOOL show;
@property (nonatomic, strong)NSIndexPath * selPath;
@end

@implementation RightTableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate =self;
        _show = NO;
        
#pragma mark - 刷新数据
        NSMutableArray * imgs = [NSMutableArray array];
        for (int i=1; i<9; i++) {
            NSString * name = [NSString stringWithFormat:@"1000%d",i];
            UIImage * image = [UIImage imageNamed:name];
            [imgs addObject:image];
        }
        
        MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(testData)];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        [header setImages:imgs forState:MJRefreshStateRefreshing];
        self.header = header;
        [self.header beginRefreshing];
    }
    return  self;
    
}


- (void)testData{
    
    [self.header endRefreshing];
 }

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.rightDataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    RightModel * model =self.rightDataArr[section];
    return  (_show && section == _selPath.section)?  (model.childCatory.count / 3) * 40  :0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 10)];
    foot.backgroundColor = [UIColor greenColor];
    return foot;
}

- (CustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    RightModel * model  =self.rightDataArr[indexPath.section];
    cell.messageLabel.text = model.mainCatory[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _selPath = indexPath;
    _show = !_show;
    
    [tableView reloadData];
    
}




@end
