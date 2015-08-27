

#import "BaseNavigationController.h"

@implementation BaseNavigationController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationBar.tintColor = [UIColor orangeColor];
    UIImage * backImg = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UINavigationBar appearance] setBackIndicatorImage:backImg];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backImg];
    
    UIBarButtonItem *backItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    UIOffset offset ;
    offset.horizontal = -500;
    [backItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
