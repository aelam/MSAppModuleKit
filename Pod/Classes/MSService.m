//
//  PlugableApp.m
//  AppSettings
//
//  Created by ryan on 15/8/10.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "MSService.h"

@implementation MSService

+ (instancetype)sharedService {
    static MSService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

- (NSString *)serviceName {
    return NSStringFromClass([self class]);
}

- (NSString *)serviceIdentifier {
    return NSStringFromClass([self class]);
}

- (NSString *)serviceVersion {
    return @"serviceVersion";
}

- (NSArray *)pageMappings {
    return nil;
}

- (NSString *)serviceBundleName {
    return NSStringFromClass([self class]);
}

- (void)serviceDidLoad:(id)info {
    
}

- (void)serviceDidUnload:(id)info {
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    
    return NO;
}

- (void)serviceDidRecieveNotification:(NSNotification *)notification {
    
}

- (BOOL)isLoaded {
    return NO;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"serviceName: %@ serviceIdentifier: %@ version: %@", [self serviceName], [self serviceIdentifier], [self serviceVersion]];
}

- (void)serviceDidBecomeActive:(id)info {
    
}

- (void)serviceWillResignActive:(id)info {
    
}


@end
