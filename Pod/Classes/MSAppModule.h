//
//  MSAppModule.h
//  Pods
//
//  Created by ryan on 15/10/13.
//
//

@import Foundation;

@protocol MSMenuItem;
@class SARoutePattern;
@class JLRoutes;

@protocol MSAppModule <NSObject>

@property(readonly, nonatomic) NSString *moduleName;
@property(readonly, nonatomic) NSString *moduleVersion;
@property(readonly, nonatomic) NSString *moduleId;

@optional

@property(readonly, nonatomic) NSArray *supportedURLSchemes; //TODO
@property(readonly, nonatomic) NSArray *pageMappings;
@property(readonly, nonatomic) NSArray<SARoutePattern *> *routeMappings;

- (void)handleAPNSWithPayLoad:(NSDictionary *)arg1;
- (UIViewController *)overlayViewController;
- (UIViewController *)auxiliaryViewController;

- (BOOL)openURL:(NSURL *)arg1 sourceApplication:(NSString *)app annotation:(id)annotation navigation:(id/* <FBNavigation>*/)arg4;

- (void)moduleDidLoad:(NSDictionary *)info;
- (void)moduleDidUnload:(NSDictionary *)info;

- (void)moduleRegisterRoutes:(JLRoutes *)route;
- (void)moduleUnregisterRoutes:(JLRoutes *)route;

- (void)moduleDidEnterBackground:(id)info;
- (void)moduleWillEnterForeground:(id)info;
- (void)moduleWillTerminate:(id)info;
- (void)moduleDidBecomeActive:(id)info;
- (void)moduleWillResignActive:(id)info;
- (void)moduleDidReceiveMemoryWarning:(id)info;
- (void)moduleDidReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)moduleDidReceiveLocalNotification:(UILocalNotification *)notification;

- (void)moduleSettingsDidChange:(NSDictionary *)settings;


@end


@interface MSAppModule:NSObject <MSAppModule> {
    BOOL _isLoaded;
    NSMutableArray *_pageMappings;
    NSArray<SARoutePattern *> *_routeMappings;
    
}


@end