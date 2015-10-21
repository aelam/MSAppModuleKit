//
//  PlugableApp.h
//  AppSettings
//
//  Created by ryan on 15/8/10.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MSService;

@protocol MSService <NSObject>

- (NSString *)serviceName;
- (NSString *)serviceIdentifier;
- (NSString *)serviceVersion;

- (void)serviceDidLoad:(id)info;
- (void)serviceDidUnload:(id)info;

@optional

- (NSString *)serviceBundleName;
- (void)serviceSettingsDidChange:(NSDictionary *)settings;

- (void)serviceDidBecomeActive:(id)info;
- (void)serviceWillResignActive:(id)info;


- (BOOL)service:(MSService *)service openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
- (BOOL)service:(MSService *)service openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options;

- (void)serviceDidReceiveMemoryWarning:(id)info;      // try to clean up as much memory as possible. next step is to terminate app
- (void)serviceWillTerminate:(id)info;
- (void)serviceDidEnterBackground:(id)info;
- (void)serviceWillEnterForeground:(id)info;

- (void)service:(MSService *)service didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_AVAILABLE_IOS(8_0);

- (void)service:(MSService *)service didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0);

- (void)service:(MSService *)service didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0);

- (void)service:(MSService *)service didReceiveRemoteNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0);

- (void)service:(MSService *)service didReceiveLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0);

// Called when your app has been activated by the user selecting an action from a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)service:(MSService *)service handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler NS_AVAILABLE_IOS(8_0);
- (void)service:(MSService *)service handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler NS_AVAILABLE_IOS(9_0);

- (void)service:(MSService *)service handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler NS_AVAILABLE_IOS(8_0);
- (void)service:(nullable MSService *)service handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler;

- (void)service:(MSService *)service didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0);

- (void)service:(MSService *)service performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0);

- (void)service:(MSService *)service performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler;

- (void)service:(MSService *)service handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler;

- (void)service:(MSService *)service handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply NS_AVAILABLE_IOS(8_2);

- (void)serviceShouldRequestHealthAuthorization:(UIApplication *)application NS_AVAILABLE_IOS(9_0);

- (void)serviceProtectedDataWillBecomeUnavailable:(UIApplication *)application NS_AVAILABLE_IOS(4_0);
- (void)serviceProtectedDataDidBecomeAvailable:(UIApplication *)application    NS_AVAILABLE_IOS(4_0);


- (void)handleNotification:(NSNotification *)notification;

@property (nonatomic, readonly) BOOL isLoaded;

@optional


@end

@interface MSService : NSObject <MSService>

+ (instancetype)sharedService;

@end

NS_ASSUME_NONNULL_END