

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)addLeftItem:(NSString *)leftImg leftTitle:(NSString *)leftTitle;
- (void)addRightItem:(NSString *)rightImg rightTitle:(NSString *)rightTitle;
- (void)addleftItem:(NSString *)leftImg rightItem:(NSString *)rightImg;
- (void)addrightItems:(NSArray *)rightItems;
- (void)addCenterView:(UIView *)view;

- (void)leftItemAction:(UIButton *)btn;
- (void)rightItemAction:(UIButton *)btn;
@end
