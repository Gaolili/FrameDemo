

#import "FirstViewController.h"

@implementation FirstViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLeftItem:@"img_1" leftTitle:nil];
    [self addRightItem:@"img_2" rightTitle:nil];
}

-(void)leftItemAction:(UIButton *)btn{
    NSLog(@"left");
}

-(void)rightItemAction:(UIButton *)btn{
    NSLog(@"right");
}
@end
