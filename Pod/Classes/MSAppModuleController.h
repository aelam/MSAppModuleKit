//
//  MSAppModuleManager.h
//  Pods
//
//  Created by ryan on 15/10/19.
//
//

#import <Foundation/Foundation.h>
#import "MSModuleDefines.h"

MS_MODULE_EXTERN NSString *MSAppModuleSettingDidChangeNotification; //TODO: 设置

@class MSAppModuleController;
@class MSAppModule;

MS_MODULE_EXTERN MSAppModuleController *appModuleManager;

@interface MSAppModuleController : NSObject {
    NSMutableDictionary *_idModuleDict;
    unsigned short _lastModuleTag;
    NSMutableArray *_modules;
    NSMutableDictionary *_bookmarkModuleDict;
    NSMutableDictionary *_externalUrlSchemeDict;
}

@property (nonatomic, strong) NSMutableDictionary *appSettings;

- (BOOL)openURL:(NSURL *)URL sourceApplication:(NSString *)sourceApp annotation:(id)arg3 navigation:(id)arg4;

- (void)addModules:(NSArray *)modules;
- (void)removeModule:(MSAppModule *)module;
- (void)addModule:(MSAppModule *)module;

@property(readonly, nonatomic) NSArray *modules;

- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)applicationWillTerminate;
- (void)applicationDidBecomeActive;
- (void)applicationWillResignActive;
- (void)applicationDidReceiveMemoryWarning;
- (void)applicationDidReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)applicationDidReceiveLocalNotification:(UILocalNotification *)notification;

@end
