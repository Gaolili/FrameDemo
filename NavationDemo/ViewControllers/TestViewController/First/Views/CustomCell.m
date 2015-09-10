

#import "CustomCell.h"
@interface CustomCell ()
@property (nonatomic, strong)UILabel * messageLabel;
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
}

- (void)setModel:(UserModel *)model{
    UserViewModel * viewModel = [[UserViewModel alloc]initWithModel:model];
    _messageLabel.text = viewModel.userMess;
}
@end
