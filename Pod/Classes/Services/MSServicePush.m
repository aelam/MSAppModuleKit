//
//  MSServicePush.m
//  Pods
//
//  Created by ryan on 15/10/19.
//
//

#import "MSServicePush.h"


MSServicePush *servicePush;

@implementation MSServicePush

- (NSString *)serviceName {
    return @"Push Service";
}

- (NSString *)serviceIdentifier {
    return NSStringFromClass([self class]);
}


+ (instancetype)sharedService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        servicePush = [[self alloc] init];
    });
    return servicePush;
}

- (void)serviceDidLoad:(id)info {
    NSLog(@"%@ - %@",  NSStringFromClass([self class]), info);
}

- (void)serviceDidUnload:(id)info {
    
}

- (void)serviceDidEnterBackground:(id)info {
    
}

- (void)serviceWillEnterForeground:(id)info {
    
}

- (void)serviceWillTerminate:(id)info {
    
}

- (void)handleNotification:(NSNotification *)notification {
    
}


- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
}


- (void)registerPushForIOS8
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    //Types
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
#endif
}

- (void)registerPush
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

- (void)registerRemoteNotification
{
    //iOS8注册push方法
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]) {
        [self registerPushForIOS8];
    } else {
        [self registerPush];
    }
#else
    //iOS8之前注册push方法
    //注册Push服务，注册后才能收到推送
    [self registerPush];
#endif
}



@end
