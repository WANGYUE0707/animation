//
//  AppDelegate.m
//  启动动画
//
//  Created by Other on 16/2/14.
//  Copyright © 2016年 wangyue. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "ViewController.h"
#define mainScreenSize [[UIScreen mainScreen] currentMode].size

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[ViewController alloc] init];
    [self setupStatrView];
    return YES;
}

- (void)setupStatrView {
    UIView *backView = [[UIView alloc] initWithFrame:self.window.frame];
    
    NSString *launchImageName = [self getLaunchImageName];
    
    UIImage *launchImage = [UIImage imageNamed:launchImageName];
    UIImageView *launchView = [[UIImageView alloc] initWithImage:launchImage];
    launchView.frame = self.window.bounds;
    [backView addSubview:launchView];
    
    [self.window addSubview:backView];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithImage:[UIImage clipImage:launchImage withRect:CGRectMake(0, 0, mainScreenSize.width, mainScreenSize.height * 0.5)]];
    topImageView.contentMode = UIViewContentModeScaleToFill;
    topImageView.width = self.window.width;
    topImageView.height = self.window.height * 0.5;
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage clipImage:launchImage withRect:CGRectMake(0, mainScreenSize.height * 0.5, mainScreenSize.width, mainScreenSize.height * 0.5)]];
    bottomImageView.y = self.window.height * 0.5;
    bottomImageView.width = self.window.width;
    bottomImageView.height = self.window.height * 0.5;
    [backView addSubview:topImageView];
    [backView addSubview:bottomImageView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        launchView.image = nil;
        [launchView removeFromSuperview];
        
        [UIView animateWithDuration:1 animations:^{
            topImageView.y = -topImageView.height;
            bottomImageView.y = bottomImageView.height * 2;
        } completion:^(BOOL finished) {
            [backView removeFromSuperview];
        }];
    });
    
}

// 获取实际使用的LaunchImage图片
- (NSString *)getLaunchImageName {
    
    CGSize viewSize = self.window.bounds.size;
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
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
