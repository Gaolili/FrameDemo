 

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
    [self.contentView addSubview:_avatorImg];
    
    _messBg = [[UIImageView alloc]init];
    [self.contentView addSubview:_messBg];
    
    _messInfo = [[UILabel alloc]init];
    [self.contentView addSubview:_messInfo];
}

- (void)setLayouts{
    if (!_isOther) {
        [_avatorImg mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
}
@end
