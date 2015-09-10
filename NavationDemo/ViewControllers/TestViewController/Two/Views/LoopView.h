 

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LVDirection) {
    LVDirectionLeft,
    LVDirectionRight,
    
};
@interface LoopView : UIView

@property (nonatomic, strong) NSString * context; //内容
@property (nonatomic, assign) float speed; //速度
@property (nonatomic, assign)LVDirection direction; //方向，

- (void) star;
- (void) pasuse;

@end
