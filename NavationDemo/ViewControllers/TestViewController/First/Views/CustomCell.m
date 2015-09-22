

#import "CustomCell.h"
@interface CustomCell ()
@end

@implementation CustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), CGRectGetHeight(self.contentView.bounds))];
    [self.contentView addSubview:_messageLabel];
    
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.bounds) -1, CGRectGetWidth(self.contentView.bounds), 1)];
    line.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:line];
}

- (void)setModel:(UserModel *)model{
    UserViewModel * viewModel = [[UserViewModel alloc]initWithModel:model];
    _messageLabel.text = viewModel.userMess;
}
@end
