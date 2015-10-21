//
//  MSAppDelegate.m
//  MSAppModuleKit
//
//  Created by Ryan Wang on 10/21/2015.
//  Copyright (c) 2015 Ryan Wang. All rights reserved.
//

#import "MSAppDelegate.h"
#import <MSAppModuleKit/MSAppModuleKit.h>
#import <MSAppModuleDemo1/SAPlugableModuleDemo1.h>
#import "MSServicePush.h"

@implementation MSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    13
//    20
    
    MSServiceDemo1 *demo1 = [[MSServiceDemo1 alloc] init];
    MSServicePush *push = [MSServicePush sharedService];
    [serviceController loadServices:@[demo1, push]];
    [appModuleManager addModule:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [serviceController applicationWillResignActive:application];
    [appModuleManager applicationWillResignActive];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    [serviceController applicationDidEnterBackground:application];
    [appModuleManager applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [serviceController applicationWillEnterForeground:application];
    [appModuleManager applicationWillEnterForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [serviceController applicationDidBecomeActive:application];
    [appModuleManager applicationDidBecomeActive];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [serviceController applicationWillTerminate:application];
    [appModuleManager applicationWillTerminate];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options NS_AVAILABLE_IOS(9_0); {
    [appModuleManager openURL:url sourceApplication:nil annotation:nil navigation:nil];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    [appModuleManager openURL:url sourceApplication:sourceApplication annotation:annotation navigation:nil];
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [appModuleManager applicationDidReceiveMemoryWarning];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [appModuleManager applicationDidReceiveRemoteNotification:userInfo];
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [appModuleManager applicationDidReceiveLocalNotification:notification];
    
}


@end
