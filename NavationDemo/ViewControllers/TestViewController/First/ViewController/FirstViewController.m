

#import "FirstViewController.h"
#import "ChatViewController.h"
#import "CustomCell.h"
#import "UserModel.h"
@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)NSMutableArray * dataArr;
@end

@implementation FirstViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    _dataArr = [NSMutableArray array];
    [self addLeftItem:@"img_1" leftTitle:nil];
    [self addRightItem:@"img_2" rightTitle:nil];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self testData];
    
}

#pragma mark - testData
- (void)testData{
    for (int i= 0; i< 10; i++) {
        UserModel * model = [[UserModel alloc]init];
        model.name = [NSString stringWithFormat:@"name_%d",i];
        model.age = i;
        [_dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - tableView 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ChatViewController * chat = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:chat animated:YES];
}



#pragma mark - leftAction
-(void)leftItemAction:(UIButton *)btn{
    NSLog(@"left");
}

-(void)rightItemAction:(UIButton *)btn{
    NSLog(@"right");
}
@end
