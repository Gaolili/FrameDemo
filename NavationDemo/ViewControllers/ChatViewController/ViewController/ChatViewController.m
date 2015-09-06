 

#import "ChatViewController.h"
#import "ChatCell.h"
#import "ChatModel.h"
#import "CustomToolBar.h"
@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  addTitle:@"聊天"];
    [self setTestData];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

-(void)setTestData{
    _dataArr =[NSMutableArray array];
    for (int i=0; i<2; i++) {
        ChatModel * model = [[ChatModel alloc]init];
        model.isOther = i;
        model.message =[NSString stringWithFormat:@"聊天啦，天啦聊天啦啦啦聊天啦聊天啦聊天啦聊天啦聊天啦聊天啦聊天啦，天啦聊天啦啦聊天啦聊天啦，，，，%d",i];
        [_dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatModel * model = self.dataArr[indexPath.row];
    return [self boundingWithSize:model.message].size.height + 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    ChatCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[ChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.chatModel = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - height Method
- (CGRect)boundingWithSize:(NSString *)string{
    CGRect rect =[string boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds)- 60, 1000)options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    return rect;
}
 @end
