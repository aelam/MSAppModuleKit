//
//  AppConfig.m
//  AppSettings
//
//  Created by ryan on 15/8/10.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "MSServiceConfig.h"

@implementation MSServiceCofig

+ (UIUserNotificationType)userNotificationTypes {
    return UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
}

+ (UIRemoteNotificationType)remoteNotificationTypes {
    return UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound;
}


@end
