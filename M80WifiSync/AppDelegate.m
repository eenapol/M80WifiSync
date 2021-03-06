//
//  AppDelegate.m
//  M80WifiSync
//
//  Created by amao on 1/12/15.
//  Copyright (c) 2015 www.xiangwangfeng.com. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import "M80ServerViewController.h"
#import "M80DirectoryViewController.h"
#import "M80PathManager.h"
#import "M80BackgroundTaskRunner.h"

@interface AppDelegate ()<WXApiDelegate>
@property (nonatomic,strong)    M80BackgroundTaskRunner *runner;
@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [WXApi registerApp:@"wx1ab7c4f3991eb5eb"];
    [self initUIAppearance];
    [self setupMainViewController];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)initUIAppearance
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:textAttributes
                                                forState:UIControlStateNormal];
}

- (void)setupBackgroundTask
{
    _runner = [[M80BackgroundTaskRunner alloc] init];
}

- (void)setupMainViewController
{
    NSMutableArray *vcs = [NSMutableArray array];
    {
        NSString *dir = [[M80PathManager sharedManager] fileStoragePath];
        M80DirectoryViewController *vc = [[M80DirectoryViewController alloc] initWithDir:dir];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"文件" image:[UIImage imageNamed:@"ic_folder"] tag:0];
        [vcs addObject:nav];
    }
    {
        M80ServerViewController *vc = [[M80ServerViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"wifi"] tag:1];
        [vcs addObject:nav];
    }
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:vcs];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url
                       delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WXApi handleOpenURL:url
                       delegate:self];
}

-(void)onReq:(BaseReq*)req
{

}

-(void)onResp:(BaseResp*)resp
{

}

@end
