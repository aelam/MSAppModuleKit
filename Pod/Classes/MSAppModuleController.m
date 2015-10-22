//
//  MSAppModuleManager.m
//  Pods
//
//  Created by ryan on 15/10/19.
//
//

#import "MSAppModuleController.h"
#import "MSAppModule.h"
#import <JLRoutes/JLRoutes.h>

NSString const *MSAppModuleSettingDidChangeNotification = @"MSAppModuleSettingDidChangeNotification";

MSAppModuleController *appModuleManager;

@interface MSAppModuleController ()

@property (nonatomic, strong) JLRoutes *routes;

@end

@implementation MSAppModuleController

+ (void)load {
    [MSAppModuleController defaultAppModuleManager];
}

+ (instancetype)defaultAppModuleManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appModuleManager = [[self alloc] init];
    });
    return appModuleManager;
}

- (instancetype)init {
    if (self = [super init]) {
        _modules = [NSMutableArray array];
        self.appSettings = [NSMutableDictionary dictionary];
        _idModuleDict = [NSMutableDictionary dictionary];
        self.routes = [JLRoutes globalRoutes];
    }
    return self;
}

- (BOOL)openURL:(NSURL *)URL sourceApplication:(NSString *)source annotation:(id)annotation navigation:(id)arg4 {
    BOOL rs = [self.routes routeURL:URL];
    
    return rs;
}

- (void)addModules:(NSArray *)modules {
    for(MSAppModule *module in modules) {
        [self addModule:module];
    }
}

- (void)removeModule:(MSAppModule *)module {
    [_modules removeObject:module];
    if([module respondsToSelector:@selector(moduleDidUnload:)]) {
        [module moduleDidUnload:self.appSettings];
    }
    
    [self unregisterRoutesWithModule:module];
}

- (void)addModule:(MSAppModule *)module {
    if (!module || [_modules containsObject:module]) {
        return;
    }
    [_modules addObject:module];
    if([module respondsToSelector:@selector(moduleDidLoad:)]) {
        [module moduleDidLoad:self.appSettings];
    }
    
    [self registerRoutesWithModule:module];
}

- (void)registerRoutesWithModule:(MSAppModule *)module {
    if([module respondsToSelector:@selector(moduleRegisterRoutes:)]) {
        [module moduleRegisterRoutes:self.routes];
    }
}

- (void)unregisterRoutesWithModule:(MSAppModule *)module {
    if([module respondsToSelector:@selector(moduleUnregisterRoutes:)]) {
        [module moduleUnregisterRoutes:self.routes];
    }
}

//MARK: - Life Cycle
- (void)applicationDidEnterBackground {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleDidEnterBackground:)]) {
            [module moduleDidEnterBackground:self.appSettings];
        }
    }
}

- (void)applicationWillEnterForeground {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleWillEnterForeground:)]) {
            [module moduleWillEnterForeground:self.appSettings];
        }
    }
}

- (void)applicationWillTerminate {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleWillTerminate:)]) {
            [module moduleWillTerminate:self.appSettings];
        }
    }
}

- (void)applicationDidBecomeActive {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleDidBecomeActive:)]) {
            [module moduleDidBecomeActive:self.appSettings];
        }
    }
}

- (void)applicationWillResignActive {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleWillResignActive:)]) {
            [module moduleWillResignActive:self.appSettings];
        }
    }
}

- (void)applicationDidReceiveMemoryWarning {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleDidReceiveMemoryWarning:)]) {
            [module moduleDidReceiveMemoryWarning:self.appSettings];
        }
    }
}

//MARK: - Notification
- (void)applicationDidReceiveRemoteNotification:(NSDictionary *)userInfo {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleDidReceiveRemoteNotification:)]) {
            [module moduleDidReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)applicationDidReceiveLocalNotification:(UILocalNotification *)notification {
    for(MSAppModule *module in _modules) {
        if([module respondsToSelector:@selector(moduleDidReceiveLocalNotification:)]) {
            [module moduleDidReceiveLocalNotification:notification];
        }
    }
}


@end
