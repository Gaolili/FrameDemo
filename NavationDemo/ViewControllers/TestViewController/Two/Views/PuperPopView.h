//
//  PuperPopView.h
//  NavationDemo
//
//  Created by gaolili on 15/9/16.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PuperPopViewDelegate <NSObject>
- (void)popViewClickAction:(NSInteger)row;
@end

@interface PuperPopView : UIView
@property (nonatomic,weak) id <PuperPopViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;
- (void) showInViews;
- (void) hideViews;
@end
