 

#import "CustomToolBar.h"
#import "GlobeHeader.h"
@implementation CustomToolBar
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _inputField = [[UITextField alloc]init];
    _inputField.layer.borderColor =[UIColor grayColor].CGColor;
    _inputField.layer.borderWidth = 0.5f;
    [self addSubview:_inputField];
    
    [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(10);
        make.right.bottom.equalTo(self).with.offset(-10);
    }];
}
@end
