 

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitle:@"动画"];
    
    
    [self createThread];
    
}


- (void)createThread{
    dispatch_queue_t seariousTeam = dispatch_queue_create("Team", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t relaxintTeam = dispatch_queue_create("Team", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(relaxintTeam, ^{
        for (int i=0; i < 20; i++) {
            NSLog(@"AAA = %%%.3f ---%@",i * 0.1 ,[NSThread currentThread]);
        }
    });
    
    dispatch_async(relaxintTeam, ^{
        for (int i=0; i < 20; i++) {
            NSLog(@"BBB = %%%.3f ---%@",i * 0.1 ,[NSThread currentThread]);
        }
    });
    
    dispatch_sync(seariousTeam, ^{
        for (int i=0; i < 10; i++) {
            NSLog(@"CCC = %%%.3f ---%@",i * 0.1 ,[NSThread currentThread]);
        }
    });
    
    dispatch_async(relaxintTeam, ^{
        for (int i=0; i < 20; i++) {
            NSLog(@"DDD = %%%.3f ---%@",i * 0.1 ,[NSThread currentThread]);
        }
    });
    dispatch_sync(seariousTeam, ^{
        for (int i=0; i < 10; i++) {
            NSLog(@"EEE = %%%.3f ---%@",i * 0.1 ,[NSThread currentThread]);
        }
    });
}

@end
