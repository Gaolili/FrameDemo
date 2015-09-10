 

#import "LoopView.h"
@interface LoopView ()
{
    NSTimer * _timer;
    UILabel * _loopLabel;
}
@end

@implementation LoopView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _loopLabel = [[UILabel alloc]init];
    _loopLabel.textColor = [UIColor blackColor];
    [self addSubview:_loopLabel];
    
    _loopLabel.frame = CGRectMake(0, 10, 60, CGRectGetHeight(self.bounds) - 10);
    
}

- (void)setContext:(NSString *)context{
    _loopLabel.text = context;
}

- (void)loopViewAction:(NSTimer * )time{
    CGRect rect = _loopLabel.frame;
    NSInteger x = rect.origin.x;
    NSInteger currectX ;
    if (_direction == LVDirectionLeft) {
          currectX = x - 5;
        if (currectX < 0) {
             currectX = CGRectGetWidth(self.bounds) - 10;
         }
      }else{
         currectX = x + 5;
          if (currectX > CGRectGetWidth(self.bounds)) {
              currectX = 0;
        }
      }
    rect.origin.x = currectX;
    
    _loopLabel.frame = rect;
}

- (void)star{
    if (_timer) {
        [_timer fire];
    }else{
          _timer = [NSTimer scheduledTimerWithTimeInterval:_speed target:self selector:@selector(loopViewAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    
}

-(void)pasuse{
    [_timer invalidate];
    _timer = nil;
}
@end
