

#import "BasePageViewController.h"
#define Sg_nor_Color [UIColor grayColor]
#define Sg_sel_Color [UIColor whiteColor]
#define Sg_Font   [UIFont systemFontOfSize:14]
@interface BasePageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UISegmentedControl * segmentControl;


@end

@implementation BasePageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    
}

- (void)setViewControllers:(NSArray *)viewControllers{
    _viewControllers = viewControllers;
    _scrollView.frame = self.view.frame;
    _scrollView.contentSize =CGSizeMake(CGRectGetWidth(self.view.bounds) * _viewControllers.count, 0);
   for (int i=0; i<_viewControllers.count; i++) {
        UIViewController * vc = [[NSClassFromString(_viewControllers[i]) alloc]init];
        vc.view.frame = CGRectMake(i * CGRectGetWidth(self.view.bounds), 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        [self.scrollView addSubview:vc.view];
    }
}

- (void)setSegmentTitles:(NSArray *)segmentTitles{
    _segmentTitles = segmentTitles;
    self.segmentControl.frame = CGRectMake(0, 0, 100, 30);
    [self addCenterView:self.segmentControl];

}

- (void)setScrollEnable:(BOOL)scrollEnable{
    self.scrollView.scrollEnabled = scrollEnable;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
     }
    return _scrollView;
}

- (UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc]initWithItems:_segmentTitles];
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:Sg_nor_Color,NSFontAttributeName:Sg_Font} forState:UIControlStateNormal];
        [_segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
        [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:Sg_sel_Color,NSFontAttributeName:Sg_Font} forState:UIControlStateSelected];
    }
    return _segmentControl;
}

#pragma - segmentClick
-(void)segmentControlAction:(UISegmentedControl *)segment{
    NSInteger value = segment.selectedSegmentIndex;
    [self.scrollView setContentOffset:CGPointMake(value * CGRectGetWidth(self.view.bounds), 0) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.segmentControl.selectedSegmentIndex = offsetX / CGRectGetWidth(self.view.bounds);
}


@end
