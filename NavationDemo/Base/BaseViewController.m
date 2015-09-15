

#import "BaseViewController.h"
#define item_W 40
#define item_H 30
@implementation BaseViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - titlte
- (void) addTitle:(NSString *)titles{
    
    self.navigationItem.title = titles;
}

#pragma mark - leftOrRight Item
- (void)addLeftItem:(NSString *)leftImg leftTitle:(NSString *)leftTitle{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(0, 0, item_W, item_H);
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (leftImg) {
        [leftBtn setBackgroundImage:[UIImage imageNamed:leftImg] forState:UIControlStateNormal];
    }
    if (leftTitle) {
        [leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    }
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}


- (void)addRightItem:(NSString *)rightImg rightTitle:(NSString *)rightTitle{
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, item_W, item_H);
    if (rightImg) {
        [rightBtn setBackgroundImage:[UIImage imageNamed:rightImg] forState:UIControlStateNormal];
    }
    if (rightTitle) {
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    }
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)addleftItem:(NSString *)leftImg rightItem:(NSString *)rightImg{
    UIButton * leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftItem addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
    leftItem.frame = CGRectMake(0, 0, item_W, item_H);
    if (leftImg) {
        [leftItem setBackgroundImage:[UIImage imageNamed:leftImg] forState:UIControlStateNormal];
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftItem];
    
    
    UIButton * rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightItem addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    rightItem.frame = CGRectMake(0, 0, item_W, item_H);
    if (rightImg) {
        [rightItem setBackgroundImage:[UIImage imageNamed:rightImg] forState:UIControlStateNormal];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightItem];
    
}

- (void)addrightItems:(NSArray *)rightItems{
    NSMutableArray * mutabArr = [NSMutableArray array];
    for (int i =0; i<rightItems.count; i++) {
        UIButton * rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        rightItem.tag = 100 + i;
        [rightItem addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
        rightItem.frame = CGRectMake(i * item_W, 0, item_W, item_H);
        [rightItem setBackgroundImage:[UIImage imageNamed:rightItems[i]] forState:UIControlStateNormal];
        UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithCustomView:rightItem];
        [mutabArr addObject:barItem];
    }
    self.navigationItem.rightBarButtonItems =mutabArr;
}

#pragma mark - centerView
- (void)addCenterView:(UIView *)view{
    self.navigationItem.titleView = view;
}



- (void)leftItemAction:(UIButton *)btn{
    NSLog(@"子类需重写 %s",__FUNCTION__);
}

-(void)rightItemAction:(UIButton *)btn{
    NSLog(@"子类需重写 %s",__FUNCTION__);

}

@end
