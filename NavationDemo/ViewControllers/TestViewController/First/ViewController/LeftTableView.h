//
//  LeftTableView.h
//  NavationDemo
//
//  Created by gaolili on 15/9/21.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LeftTableViewDelegate <NSObject>

- (void)LeftCellClick:(NSIndexPath *)path;

@end

@interface LeftTableView : UITableView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSArray * leftDataArr;
@property (nonatomic, weak)id <LeftTableViewDelegate>Leftdelegate;
@end
