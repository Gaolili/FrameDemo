 

#import "PopView.h"

#define kAlertW 200
#define kAlertH 100
@implementation PopView

- (instancetype)init{
    self = [super init];
    if (self) {
        _titleLabel = [self customLabel:@"标题" font:14];
        _titleLabel.frame = CGRectMake(0, 10, 200, 30);
        [self addSubview:_titleLabel];
        
        _messageLabel = [self customLabel:@"内容内容内容内容内容内容内容内容内容内容" font:13];
        _messageLabel.frame = CGRectMake(0, 40, 200, 60);
        [self addSubview:_messageLabel];
        
     }
    return self;
}

+ (id)shareInstance{
    static PopView * popInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popInstance =[[self alloc]init];
        
    });
    return popInstance;
}

- (void)showView{
    UIViewController * topVC = [self appRootViewController];
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertW) * 0.5, (CGRectGetHeight(topVC.view.bounds) - kAlertH) * 0.5, kAlertW, kAlertH);
    self.center = topVC.view.center;
    [topVC.view addSubview:self];
    
}

- (UIViewController *)appRootViewController{
    UIViewController * appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController * topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview == nil) {
        return;
    }
    UIViewController * topVC = [self appRootViewController];
    if (!_backImgaeView) {
        _backImgaeView = [[UIView alloc]initWithFrame:topVC.view.bounds];
        _backImgaeView.backgroundColor = [UIColor blackColor];
        _backImgaeView.alpha = 0.6f;
    }
    
    [topVC.view addSubview:_backImgaeView];
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.35];
    
    [UIView commitAnimations];
    
    
    [super willMoveToSuperview:newSuperview];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}


- (void)removeFromSuperview{
    [_backImgaeView removeFromSuperview];
    _backImgaeView = nil;
    [super removeFromSuperview];
}


- (UILabel *)customLabel:(NSString *)content font:(CGFloat)font{
    UILabel * lab = [[UILabel alloc]init];
    lab.numberOfLines = 0;
    lab.text = content;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:font];
    return lab;
}
@end
