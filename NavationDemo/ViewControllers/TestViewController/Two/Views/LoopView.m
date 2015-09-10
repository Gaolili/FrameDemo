 

#import "LoopView.h"

@interface LoopView ()
{
    NSTimer * _timer;
    UILabel * loopLabel;
}

@end

@implementation LoopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
}
@end
