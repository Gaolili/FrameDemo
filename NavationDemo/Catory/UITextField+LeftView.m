

#import "UITextField+LeftView.h"

@implementation UITextField (LeftView)
- (UITextField * )textFieldPlaceHold:(NSString *)placeHold leftImg:(NSString *)leftImg{
    UITextField * textField = [[UITextField alloc]init];
    textField.placeholder = placeHold;
    textField.leftViewMode = UITextFieldViewModeAlways;
    UIView * leftV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView * Img = [[UIImageView alloc]initWithFrame:leftV.frame];
    Img.image = [UIImage imageNamed:leftImg];
    [leftV addSubview:Img];
    textField.leftView = leftV;
    return textField;
}

@end
