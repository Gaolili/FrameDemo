

#import "UserViewModel.h"

@implementation UserViewModel
- (id)initWithModel:(UserModel *)userModel{
    self = [super init];
    if (self) {
        _userMess = [NSString stringWithFormat:@"姓名:%@,年龄:%d",userModel.name,userModel.age];
    }
    return self;
}

@end
