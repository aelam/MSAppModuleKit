//
//  MSAppModule.h
//  Pods
//
//  Created by ryan on 15/10/13.
//
//

@import Foundation;

#import "MSAppSettings.h"

@class JLRoutes;

@protocol MSAppModule <NSObject>

/* 模块基本信息 默认值会根据类名产生 */
@property(readonly, nonatomic) NSString *moduleName;
@property(readonly, nonatomic) NSString *moduleVersion;
@property(readonly, nonatomic) NSString *moduleId;

@optional

/* 
 * 页面跳转相关
 * @param: supportedURLSchemes 模块当前支持的URLSchemes 目前没有做处理 
 * @param: pageMappings pageId与Controller的映射 用于页面跳转
 * @param: routeMappings url与controller跳转的映射 用于页面跳转
 */
@property(readonly, nonatomic) NSArray *supportedURLSchemes; //TODO

/* 模块加载与卸载时候会调用 */
- (void)moduleDidLoad:(id<MSAppSettings>)info;
- (void)moduleDidUnload:(id<MSAppSettings>)info;


/* 注册Routes */
- (void)moduleRegisterRoutes:(JLRoutes *)route;
- (void)moduleUnregisterRoutes:(JLRoutes *)route;

/* 模块加载器会根据应用状态触发这些对应的方法 */
- (void)moduleDidEnterBackground:(id)info;
- (void)moduleWillEnterForeground:(id)info;
- (void)moduleWillTerminate:(id)info;
- (void)moduleDidBecomeActive:(id)info;
- (void)moduleWillResignActive:(id)info;
- (void)moduleDidReceiveMemoryWarning:(id)info;

// 推送处理
- (void)moduleDidRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;
- (void)moduleDidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)moduleDidFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

- (void)moduleDidReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)moduleDidReceiveLocalNotification:(UILocalNotification *)notification;
- (void)moduleDidRecieveNotification:(NSNotification *)notification;


// TODO
// 用于状态改变
- (void)moduleSettingsDidChange:(NSDictionary *)settings;



//- (void)handleAPNSWithPayLoad:(NSDictionary *)arg1;
//- (UIViewController *)overlayViewController;
//- (UIViewController *)auxiliaryViewController;
//
//- (BOOL)openURL:(NSURL *)arg1 sourceApplication:(NSString *)app annotation:(id)annotation navigation:(id/* <FBNavigation>*/)arg4;
//@property(readonly, nonatomic) NSArray *pageMappings;
//@property(readonly, nonatomic) NSArray<SARoutePattern *> *routeMappings;

@end


@interface MSAppModule:NSObject <MSAppModule> {
    BOOL _isLoaded;
    NSMutableArray *_pageMappings;
}




@end