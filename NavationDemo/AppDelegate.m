//
//  AppDelegate.m
//  NavationDemo
//
//  Created by gaolili on 15/8/27.
//  Copyright (c) 2015年 mRocker. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseIntroductViewController.h"
#import "BaseTabBarController.h"

#import <Bugtags/Bugtags.h>

@interface AppDelegate ()
@property (nonatomic, strong)BaseIntroductViewController * introViewController;
@property (nonatomic, strong)BaseTabBarController * tarBarViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if ([self shouldIntrolVC]) {
        [self.window setRootViewController:self.introViewController];
    }else{
        [self.window setRootViewController:self.tarBarViewController];
    }
    
    [self.window makeKeyAndVisible];
    
    //测试
//    [Bugtags startWithAppKey:@"01affacc44e3b33bb6defb84a76bbe2b" invocationEvent:BTGInvocationEventBubble];
    return YES;
}



- (BaseIntroductViewController *)introViewController{
    if (!_introViewController) {
        _introViewController = [[BaseIntroductViewController alloc]init];
        _introViewController.intrImgArr = @[@"intro_1",@"intro_2",@"intro_3"];
    }
    return _introViewController;
}

- (BaseTabBarController *)tarBarViewController{
    if (!_tarBarViewController) {
        _tarBarViewController = [[BaseTabBarController alloc]init];
    }
    return _tarBarViewController;
}


- (BOOL)shouldIntrolVC{
    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleVersion = infoDic[@"CFBundleVersion"];
    NSString * lastBundleVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastBundleVersion"];
    if ([bundleVersion isEqualToString:lastBundleVersion]) {
        return NO;
    }else{
        return YES;
    }
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
