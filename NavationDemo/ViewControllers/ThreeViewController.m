

#import "ThreeViewController.h"

@implementation ThreeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewControllers = @[@"PageOneViewController",@"PageTwoViewController",@"PageThreeViewController"];
    self.segmentTitles = @[@"pageOne",@"pageTwo",@"pageThree"];
    self.scrollEnable = YES;
}
@end
