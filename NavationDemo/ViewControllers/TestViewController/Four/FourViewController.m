

#import "FourViewController.h"
#import "MXPullDownMenu.h"

@interface FourViewController ()<MXPullDownMenuDelegate>

@end

@implementation FourViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self addTitle:@"test4"];
    
    NSArray *testArray;
    testArray = @[ @[ @"这是长字符串的测试数据,所以要足够长", @"通过实现", @"代理来对", @"下拉菜单", @"的点击做" , @"出反馈" , @"就是这样" ], @[@"使用数组", @"进行初始化"], @[@"食物", @"水果", @"面食", @"肉类", @"素食"] ];
    
    
    MXPullDownMenu *menu = [[MXPullDownMenu alloc] initWithArray:testArray selectedColor:[UIColor greenColor]];
    menu.delegate = self;
    menu.frame = CGRectMake(0,0, menu.frame.size.width, menu.frame.size.height);
    [self.view addSubview:menu];
}

- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row{
    NSLog(@"===%ld",row);
}

@end
