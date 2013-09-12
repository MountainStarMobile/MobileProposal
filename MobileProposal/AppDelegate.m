//
//  AppDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "AppDelegate.h"
#import "GlobalFunctions.h"
#import "MSNavigationPaneViewController.h"
#import "MSMasterViewController.h"
#import "ViewController.h"

#import "systemParamater.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[systemParamater systemParamaterInstance] setAgentCode:[NSString stringWithFormat:@"F000000001"]];
    [[systemParamater systemParamaterInstance] setName:[NSString stringWithFormat:@"李大仁"]];
    [[systemParamater systemParamaterInstance] setBelongOrg:@"XXX001"];
    [[systemParamater systemParamaterInstance] setBelongOrgName:@"保險經紀代理人"];
    [[systemParamater systemParamaterInstance] setTitle:@"業務經理"];
    [[systemParamater systemParamaterInstance] setBrokerCode:[NSNumber numberWithInteger:1]];

    
    self.navigationPaneViewController = [[MSNavigationPaneViewController alloc] init];
    
    MSMasterViewController *masterViewController = [[MSMasterViewController alloc] init];
    masterViewController.navigationPaneViewController = self.navigationPaneViewController;
    
    self.navigationPaneViewController.masterViewController = masterViewController;
    
    [masterViewController transitionToViewController:MSPaneViewControllerTypeRed];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationPaneViewController;
    [self.window makeKeyAndVisible];
    
    //產生UUID 替代 UDID
    NSString *UUID = [[NSUserDefaults standardUserDefaults] valueForKey:UUID_KEY];
    NSLog(@"UUID:%@",UUID);
    if (UUID == nil)
    {
        UUID = [[GlobalFunctions globalInstance] GetUUID];
        NSLog(@"create UUID:%@",UUID);
        [[NSUserDefaults standardUserDefaults] setValue:UUID forKey:UUID_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
