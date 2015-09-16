

#import "SecondViewController.h"
#import "LoopView.h"
#import "PuperPopView.h"

@interface SecondViewController ()<PuperPopViewDelegate>
@property (nonatomic,strong)PuperPopView * pop;
@end

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
        [self setPopView];
     }else if (btn.tag == 101){
        NSLog(@"2");
    }
}

- (void)setPopView{
    if (!_pop) {
        _pop = [[PuperPopView alloc]initWithFrame:CGRectMake(10, 0, 140, 88 + 44) items:@[@"11111",@"2222",@"3333"]];
         _pop.delegate = self;
         [self.view addSubview:_pop];
    }
    
    [_pop showInViews];
   
   
}



- (void)popViewClickAction:(NSInteger)row{
    NSLog(@"你点击的是--%d",row);
    [_pop hideViews];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_pop hideViews];
}

@end
