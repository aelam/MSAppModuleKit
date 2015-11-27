//
//  RWAppLoader.m
//  AppSettings
//
//  Created by ryan on 15/8/13.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "MSServiceController.h"
#import "MSService.h"

NSString const* MSServiceSettingDidChangeNotification = @"MSServiceSettingDidChangeNotification";

@class MSServiceController;

MSServiceController *serviceController;

@interface MSServiceController ()

@property (nonatomic, strong) NSMutableArray *loadedModules;

@end


@implementation MSServiceController

+ (void)load {
    [self defaultserviceController];
}

+ (instancetype)defaultserviceController {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceController = [[self alloc] init];
    });
    return serviceController;
}

- (instancetype)init {
    if (self = [super init]) {
        self.loadedModules = [NSMutableArray array];
    }
    return self;
}

- (void)loadServices:(NSArray *)services {
    for(MSService *service in services) {
        [self loadService:service];
    }
}

- (void)loadService:(MSService *)service {
    if(!service || [self.loadedModules containsObject:service]) {
        return;
    }
    [self.loadedModules addObject:service];
    [service serviceDidLoad:self.serviceSettings];
    NSLog(@"loaded Service: %@", service);
}

- (void)unloadService:(MSService *)service {
    [self.loadedModules removeObject:service];
    [service serviceDidUnload:service];
}

- (MSService *)getService:(Class)aClass {
    for(MSService *app in self.loadedModules) {
        if ([app isKindOfClass:aClass]) {
            return app;
        }
    }
    return nil;
}


- (void)autoDiscoverServices {
    
}

- (void)appSettingsDidChange:(NSDictionary *)changedKeyValue {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceSettingsDidChange:)]) {
            [service serviceSettingsDidChange:changedKeyValue];
        }
    }
}

//MARK: UIApplicationDelegate
- (void)applicationDidBecomeActive:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceDidBecomeActive:)]) {
            [service serviceDidBecomeActive:application];
        }
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceWillResignActive:)]) {
            [service serviceWillResignActive:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:openURL:sourceApplication:annotation:)]) {
            BOOL rs = [service service:service openURL:url sourceApplication:sourceApplication annotation:annotation];
            if (rs) {
                return YES;
            }
        }
    }
    return NO;
}

//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
//    for(MSService *service in self.loadedModules) {
//        if ([service respondsToSelector:@selector(service:openURL:options:)]) {
//            BOOL rs = [service service:service openURL:url options:options];
//            if (rs) {
//                return YES;
//            }
//        }
//    }
//    return NO;
//    
//}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceDidReceiveMemoryWarning:)]) {
            [service serviceDidReceiveMemoryWarning:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceWillTerminate:)]) {
            [service serviceWillTerminate:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceDidEnterBackground:)]) {
            [service serviceDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceWillEnterForeground:)]) {
            [service serviceWillEnterForeground:application];
        }
    }
}

- (void)applicationSignificantTimeChange:(id)info {
}


@end

@implementation MSServiceController (APNS)

// Push
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:didRegisterUserNotificationSettings:)]) {
            [service service:service didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:didReceiveRemoteNotification:)]) {
            [service service:service didReceiveRemoteNotification:userInfo];
        }
    }
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
            [service service:service didRegisterForRemoteNotificationsWithDeviceToken:devToken];
        }
    }
    
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:didFailToRegisterForRemoteNotificationsWithError:)]) {
            [service service:service didFailToRegisterForRemoteNotificationsWithError:err];
        }
    }
}

@end


@implementation MSServiceController (Actions)

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(nonnull UILocalNotification *)notification completionHandler:(nonnull void (^)())completionHandler {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:handleActionWithIdentifier:forLocalNotification:completionHandler:)]) {
            [service service:service handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:handleActionWithIdentifier:forLocalNotification:completionHandler:)]) {
            [service service:service handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
}

//- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
//    
//}

@end

@implementation MSServiceController (handleEventsForBackgroundURLSession)

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler {
    
}

@end

@implementation MSServiceController (WacthKit)

- (void)application:(UIApplication *)app handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(service:handleWatchKitExtensionRequest:reply:)]) {
            [service service:service handleWatchKitExtensionRequest:userInfo reply:reply];
        }
    }
}

@end

@implementation MSServiceController (HealthCare)

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceShouldRequestHealthAuthorization:)]) {
            [service serviceShouldRequestHealthAuthorization:application];
        }
    }
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceProtectedDataWillBecomeUnavailable:)]) {
            [service serviceProtectedDataWillBecomeUnavailable:application];
        }
    }
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application {
    for(MSService *service in self.loadedModules) {
        if ([service respondsToSelector:@selector(serviceProtectedDataDidBecomeAvailable:)]) {
            [service serviceProtectedDataDidBecomeAvailable:application];
        }
    }
}


@end
