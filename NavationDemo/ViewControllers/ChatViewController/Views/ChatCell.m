 

#import "ChatCell.h"

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
    }
    return self;
}

- (void)setUI{
    _avatorImg = [[UIImageView alloc]init];
    
}
@end
