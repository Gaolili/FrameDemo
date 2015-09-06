 

#import "ChatCell.h"
#import <Masonry.h>

@interface ChatCell ()
@property (nonatomic,strong)UIImageView * avatorImg;
@property (nonatomic,strong)UIImageView * messBg;
@property (nonatomic,strong)UILabel * messInfo;
@end

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
        [self setLayouts];
    }
    return self;
}

- (void)setUI{
    _avatorImg = [[UIImageView alloc]init];
    _avatorImg.layer.cornerRadius = 15;
    _avatorImg.layer.masksToBounds = NO;
    [self.contentView addSubview:_avatorImg];
    
    _messBg = [[UIImageView alloc]init];
    [self.contentView addSubview:_messBg];
    
    _messInfo = [[UILabel alloc]init];
    _messInfo.font = [UIFont systemFontOfSize:14];
    _messInfo.numberOfLines = 0;
    _messInfo.backgroundColor = [UIColor yellowColor];
    [_messBg addSubview:_messInfo];
}

- (void)setLayouts{
    UIView * superView = self.contentView;
   
    if (!_chatModel.isOther) {
//        _messBg.image = [UIImage imageNamed:@"bubble_stroked"];
        _avatorImg.backgroundColor = [UIColor redColor];
        [_avatorImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.mas_right).with.offset(-10);
            make.top.equalTo(superView.mas_top).with.offset(10);
            make.width.height.equalTo(@30);
        }];
        [_messBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_avatorImg.mas_left).with.offset(-5);
            make.top.equalTo(superView.mas_top).with.offset(5);
            make.bottom.equalTo(superView.mas_bottom).with.offset(-5);
            make.left.equalTo(superView.mas_left).with.offset(10);
        }];
        [_messInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(_messBg).with.offset(5);
            make.right.bottom.equalTo(_messBg).with.offset(-5);
        }];
    }else{
//        _messBg.image =[UIImage imageNamed:@"bubble_other"];
        _avatorImg.backgroundColor = [UIColor purpleColor];
        [_avatorImg mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(superView).with.offset(10);
            make.width.height.equalTo(@30);
        }];
        [_messBg mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatorImg.mas_right).with.offset(10);
            make.top.equalTo(superView.mas_top).with.offset(5);
            make.right.equalTo(superView.mas_right).with.offset(-10);
            make.bottom.equalTo(superView.mas_bottom).with.offset(-5);
        }];
        [_messInfo mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(_messBg).with.offset(5);
            make.right.bottom.equalTo(_messBg).with.offset(-5);
        }];
    }
    
}

-(void)setChatModel:(ChatModel *)chatModel
{
    _chatModel = chatModel;
    _messInfo.text = _chatModel.message;
    
    [self setLayouts];

    
}
@end
