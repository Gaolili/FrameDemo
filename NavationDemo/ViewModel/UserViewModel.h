

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserViewModel : NSObject

- (id)initWithModel:(UserModel *)userModel;
@property (nonatomic,strong)NSString * userMess;

@end
