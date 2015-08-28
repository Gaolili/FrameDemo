

#import "BaseIntroductViewController.h"
#import "BaseTabBarController.h"

@implementation BaseIntroductViewController
- (void)viewDidLoad{
    [super viewDidLoad];
}



#pragma mark - UI

- (void)setUI{
    [self setScrollView];
    [self setPageControl];
    [self setStarBtn];
}

- (void)setScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_scrollView];
}

- (void)setPageControl{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) /2 - 50, CGRectGetHeight(self.view.bounds) - 60, 100, 30)];
    [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    _pageControl.currentPage = 0;
    _pageControl.tintColor = [UIColor greenColor];
    [self.view addSubview:_pageControl];
    
}

- (void)setStarBtn{
    _starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_starBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [_starBtn addTarget:self action:@selector(gotoMainActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    _starBtn.backgroundColor = [UIColor redColor];
    _starBtn.layer.cornerRadius = 3;
    _starBtn.layer.masksToBounds = NO;
    _starBtn.layer.borderWidth = .5f;
    _starBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
}


- (void)setShowPageControl:(BOOL)showPageControl{
    _pageControl.hidden = showPageControl;
}

- (void)setIntrImgArr:(NSArray *)intrImgArr{
    [self setUI];
    _pageControl.numberOfPages = intrImgArr.count;
    _scrollView.contentSize = CGSizeMake(intrImgArr.count * CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    for (int i=0; i<intrImgArr.count; i++) {
        UIImageView * intr = [[UIImageView alloc]initWithFrame:CGRectMake(i* CGRectGetWidth(self.view.bounds), 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        intr.image = [UIImage imageNamed:@"intro_1"];
        [_scrollView addSubview:intr];
    }
    [_scrollView addSubview:_starBtn];
    _starBtn.frame = CGRectMake(intrImgArr.count * CGRectGetWidth(self.view.bounds) -CGRectGetWidth(self.view.bounds)/2 - 50 , CGRectGetHeight(self.view.bounds) -150, 100, 30);
}


#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currenPage = scrollView.contentOffset.x / CGRectGetWidth(self.view.bounds);
    _pageControl.currentPage = currenPage;
}

-(void)pageControlAction:(UIPageControl *)control{
    NSInteger currentPage = control.currentPage;
    [_scrollView setContentOffset:CGPointMake(currentPage * CGRectGetWidth(self.view.bounds), 0) animated:YES];
}

- (void)gotoMainActionBtn:(UIButton *)btn{
    
        NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString * bundleVersion = infoDic[@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults] setObject:bundleVersion forKey:@"lastBundleVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIWindow * _window = [UIApplication sharedApplication].keyWindow;
        BaseTabBarController * tab = [[BaseTabBarController alloc]init];
        [_window setRootViewController:tab];
}

@end
