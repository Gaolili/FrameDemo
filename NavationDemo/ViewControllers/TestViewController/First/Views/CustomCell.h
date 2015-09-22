

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "UserViewModel.h"
@interface CustomCell : UITableViewCell
@property (nonatomic, strong)UILabel * messageLabel;
@property (nonatomic,strong)UserModel * model;
@end
