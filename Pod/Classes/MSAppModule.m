//
//  MSAppModule.m
//  Pods
//
//  Created by ryan on 15/10/19.
//
//

#import "MSAppModule.h"
#import <JLRoutes/JLRoutes.h>
#import "UIApplication+ActiveController.h"

@implementation MSAppModule

- (instancetype)init {
    if (self = [super init]) {
        _pageMappings = [NSMutableArray array];
        _routeMappings = [NSMutableArray array];
    }
    return self;
}

- (NSString *)moduleId {
    return @"MSAppModule";
}

- (NSString *)moduleName {
    return @"MSAppModuleName";
}

- (NSString *)moduleVersion {
    return @"1.0";
}

- (void)moduleDidLoad:(NSDictionary *)info {
    
}

- (void)moduleDidUnload:(NSDictionary *)info {
    
}

- (void)moduleDidEnterBackground:(id)info {
    
}

- (void)moduleWillEnterForeground:(id)info {
    
}

- (void)moduleWillTerminate:(id)info {
    
}

- (void)moduleSettingsDidChange:(NSDictionary *)settings {
    
}


- (BOOL)openURL:(NSURL *)arg1 sourceApplication:(NSString *)arg2 annotation:(id)arg3 navigation:(id/* <FBNavigation>*/)arg4 {
    return NO;
}


- (void)moduleDidRecieveNotification:(NSNotification *)notification {
    
}

- (void)handleAPNSWithPayLoad:(NSDictionary *)arg1 launchedByUser:(BOOL)arg2 {
    
}

- (void)moduleRegisterRoutes:(JLRoutes *)route {
    [route addRoute:@"path" handler:^BOOL(NSDictionary *parameters) {
        [[UIApplication sharedApplication] topViewController];
        
        return YES;
    }];
}

- (void)moduleUnregisterRoutes:(JLRoutes *)route {
    [route removeRoute:@"path"];
}

@end
