

#import "PageThreeViewController.h"

@implementation PageThreeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    UILabel * lab = [self customLabel:@"3"];
    lab.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:lab];
}

- (UILabel *)customLabel:(NSString *)title{
    UILabel * lab = [[UILabel alloc]init];
    lab.backgroundColor = [UIColor orangeColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = title;
    return lab;
}
@end
