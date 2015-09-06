

#import "FiveViewController.h"
#import "BaseTabBarController.h"
@implementation FiveViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    BaseTabBarController  *tab =(BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    tab.selectedIndex = 0;
     [self.navigationController popViewControllerAnimated:YES];
    
}
@end
