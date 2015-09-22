//
//  RightTableViewController.h
//  NavationDemo
//
//  Created by gaolili on 15/9/21.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightTableView : UITableView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSArray * rightDataArr;

@end
