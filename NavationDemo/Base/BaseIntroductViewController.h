

#import "BaseViewController.h"



@interface BaseIntroductViewController : BaseViewController<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl * _pageControl;
    UIButton * _starBtn;
}
@property (nonatomic, copy) void(^gotoMainBlack)();
@property (nonatomic, strong) NSArray * intrImgArr; //引导图数组
@property (nonatomic, assign) BOOL showPageControl;

@end
