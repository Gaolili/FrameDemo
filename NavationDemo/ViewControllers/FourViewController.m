

#import "FourViewController.h"
#import "FiveViewController.h"
@implementation FourViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    FiveViewController * five = [[FiveViewController alloc]init];
    [self.navigationController pushViewController:five animated:YES];
}
@end
