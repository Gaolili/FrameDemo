

#import "SecondViewController.h"
#import "LoopView.h"



@implementation SecondViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addrightItems:@[@"img_1",@"img_2"]];
    
    LoopView * loopView = [[LoopView alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];
    loopView.context = @"滚动啦";
    loopView.speed = 0.23;
    loopView.direction = LVDirectionLeft;
    [loopView star];
    [self.view addSubview:loopView];
}

- (void)rightItemAction:(UIButton *)btn{
    if (btn.tag == 100) {
        NSLog(@"1");
    }else if (btn.tag == 101){
        NSLog(@"2");
    }
}
@end
