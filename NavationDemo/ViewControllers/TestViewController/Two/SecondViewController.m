

#import "SecondViewController.h"
#import "LoopView.h"
#import "PuperPopView.h"
#import "AnimationViewController.h"
@interface SecondViewController ()<PuperPopViewDelegate>
@property (nonatomic,strong)PuperPopView * pop;
@property (nonatomic,strong)LoopView * loopView;
@end

@implementation SecondViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addrightItems:@[@"img_1",@"img_2"]];
    
    UIImage * image = [UIImage imageNamed:@"intro_1"];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(100, -160, 0, 0);
    
       [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
         imageView.frame = CGRectMake(100, 100, 160, 160);
        [self.view addSubview:imageView];
    } completion:^(BOOL finished){
        
    }];


}

- (void)rightItemAction:(UIButton *)btn{
    if (btn.tag == 100) {
        [self setPopView];
     }else if (btn.tag == 101){
         [self setLoopView];
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


- (void)setLoopView{
    if (!_loopView) {
        _loopView = [[LoopView alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];
        _loopView.context = @"滚动啦";
        _loopView.speed = 0.23;
        _loopView.direction = LVDirectionLeft;
        _loopView.hidden = YES;
        [_loopView star];
        [self.view addSubview:_loopView];
    }
    _loopView.hidden = !_loopView.hidden;
}

- (void)popViewClickAction:(NSInteger)row{
    NSLog(@"你点击的是--%d",row);
    [_pop hideViews];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
     [_pop hideViews];
    AnimationViewController * animation = [[AnimationViewController alloc]init];
    [self.navigationController pushViewController:animation animated:YES];
}


@end
