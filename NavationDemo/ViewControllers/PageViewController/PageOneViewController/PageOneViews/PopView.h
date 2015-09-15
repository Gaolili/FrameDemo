 

#import <UIKit/UIKit.h>

@interface PopView : UIView
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIView * backImgaeView;

+ (id)shareInstance;
- (void)showView;
@end
