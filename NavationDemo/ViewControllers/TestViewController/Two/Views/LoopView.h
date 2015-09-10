 

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, LVDirection) {
    LVLeftDirection,
    LVRightDirection,
};
@interface LoopView : UIView

@property (nonatomic,assign) float speed;
@property (nonatomic,strong) NSString * content;
- (void) star;
- (void) pause;

@end
