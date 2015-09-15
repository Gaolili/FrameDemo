

#import "BaseViewController.h"



@interface BasePageViewController : BaseViewController
@property (nonatomic,strong)NSArray * segmentTitles;
@property (nonatomic,strong)NSArray * viewControllers;
@property (nonatomic,assign)BOOL scrollEnable;
@property (nonatomic,strong)BaseViewController * currentViewController;

@end
