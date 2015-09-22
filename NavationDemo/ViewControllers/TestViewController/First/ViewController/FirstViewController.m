

#import "FirstViewController.h"
#import "LeftTableView.h"
#import "RightTableView.h"
#import "RightModel.h"

@interface FirstViewController ()<LeftTableViewDelegate>
@property (nonatomic, strong)NSArray * dataArr;
@property (nonatomic, strong)LeftTableView * leftTableView;
@property (nonatomic, strong)RightTableView * rightTableView;
@property (nonatomic, strong)NSMutableArray * rightDataArr;
@end

@implementation FirstViewController
-(void)viewDidLoad{
    [super viewDidLoad];
  
    [self addLeftItem:@"img_1" leftTitle:nil];
    [self addRightItem:@"img_2" rightTitle:nil];
    
    _dataArr =@[@[@"全部",@"音乐",@"美术"],@[@"声乐",@"舞蹈",@"爵士",@"拉丁"],@[@"书法",@"鉴赏",@"戏剧"]];
    _rightDataArr = [NSMutableArray array];
    
    for ( int i =0; i < 3; i++) {
        RightModel * model = [[RightModel alloc]init];
        model.mainCatory =@[@"main0",@"main1",@"main2"];
        model.childCatory = @[@"child0",@"child1",@"child2",@"child0",@"child1",@"child2"];
        [_rightDataArr addObject:model];
    }
    
    _leftTableView = [[LeftTableView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    _leftTableView.Leftdelegate = self;
    _leftTableView.leftDataArr = @[@"全部",@"音乐",@"美术"];
     [self.view addSubview:_leftTableView];
    
    _rightTableView = [[RightTableView alloc]initWithFrame:CGRectMake(100, 0, CGRectGetWidth(self.view.bounds) - 100, 400)];
    _rightTableView.rightDataArr = _rightDataArr;
    [self.view addSubview:_rightTableView];
}


- (void)LeftCellClick:(NSIndexPath *)path{
//    _rightTableView.rightDataArr = _dataArr[path.row];
    [_rightTableView reloadData];
}


#pragma mark - leftAction
-(void)leftItemAction:(UIButton *)btn{
    NSLog(@"left");
}

-(void)rightItemAction:(UIButton *)btn{
    NSLog(@"right");
}
@end
