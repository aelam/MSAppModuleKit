//
//  MSAppDelegate.m
//  MSAppModuleKit
//
//  Created by Ryan Wang on 10/21/2015.
//  Copyright (c) 2015 Ryan Wang. All rights reserved.
//

#import "MSAppDelegate.h"
#import <MSAppModuleKit/MSAppModuleKit.h>

@implementation MSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id<MSAppSettings>appSettings = [MSAppSettings new];
    [MSAppModuleController appModuleControllerWithSettings:appSettings];
    MSAppModule *a = [MSAppModule new];
    [appModuleManager addModule:a];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [appModuleManager applicationWillResignActive];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    [appModuleManager applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [appModuleManager applicationWillEnterForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [appModuleManager applicationDidBecomeActive];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
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


// 推送
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [appModuleManager applicationDidRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [appModuleManager applicationDidRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [appModuleManager applicationDidFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [appModuleManager applicationDidReceiveRemoteNotification:userInfo];
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [appModuleManager applicationDidReceiveLocalNotification:notification];
}


@end
