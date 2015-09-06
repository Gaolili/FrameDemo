

#import "SecondViewController.h"

@implementation SecondViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addrightItems:@[@"img_1",@"img_2"]];
}

- (void)rightItemAction:(UIButton *)btn{
    if (btn.tag == 100) {
        NSLog(@"1");
    }else if (btn.tag == 101){
        NSLog(@"2");
    }
}
@end
