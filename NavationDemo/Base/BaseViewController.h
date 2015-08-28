

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//添加导航栏标题
- (void) addTitle:(NSString *)titles;

//添加左右图标或文字
- (void)addLeftItem:(NSString *)leftImg leftTitle:(NSString *)leftTitle;
- (void)addRightItem:(NSString *)rightImg rightTitle:(NSString *)rightTitle;
- (void)addleftItem:(NSString *)leftImg rightItem:(NSString *)rightImg;
- (void)addrightItems:(NSArray *)rightItems;

//添加导航栏中间view
- (void)addCenterView:(UIView *)view;

//左右图标的点击事件，子类需要重写
- (void)leftItemAction:(UIButton *)btn;
- (void)rightItemAction:(UIButton *)btn;
@end
