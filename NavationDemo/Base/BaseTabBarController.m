

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
@implementation BaseTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTabBarViewController];
}


- (void)setTabBarViewController{
    NSArray * vcStr =@[@"FirstViewController",@"SecondViewController",@"ThreeViewController",@"FourViewController"];
    NSArray * itemTitle =@[@"1",@"2",@"3",@"4"];
    NSArray * itemImg = @[@"img_1",@"img_2",@"img_3",@"img_4"];
    NSArray * itemImg_sel = @[@"img_5",@"img_6",@"img_7",@"img_8"];
    NSMutableArray * mutaVc =[NSMutableArray array];
    for (int i=0; i<vcStr.count; i++) {
        UIViewController * viewController = [[[NSClassFromString(vcStr[i])  class] alloc]init];
        viewController.title = itemTitle[i];
        UIImage * normalImg = [UIImage imageNamed:itemImg[i]];
        UIImage * selImg = [UIImage imageNamed:itemImg_sel[i]];
        viewController.tabBarItem.image = [normalImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage =[selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        BaseNavigationController * nav  = [[BaseNavigationController alloc]initWithRootViewController:viewController];
        [mutaVc addObject:nav];
    }
    self.viewControllers = mutaVc;
}


@end
