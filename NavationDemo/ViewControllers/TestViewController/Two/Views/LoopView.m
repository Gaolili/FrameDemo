 

#import "LoopView.h"

@interface LoopView ()
{
    NSTimer * _timer;
    UILabel * _loopLabel;
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
    _loopLabel =[[UILabel alloc]init];
    _loopLabel.text = _content;
    [self addSubview:_loopLabel];
    
    [_loopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
     }];
 }
@end
