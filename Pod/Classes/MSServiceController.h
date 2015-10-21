//
//  RWAppLoader.h
//  AppSettings
//
//  Created by ryan on 15/8/13.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//


@import Foundation;

#import "MSModuleDefines.h"

MS_MODULE_EXTERN NSString *MSServiceSettingDidChangeNotification; //TODO: 设置

@class MSService;
@class MSServiceController;

MS_MODULE_EXTERN MSServiceController *serviceController;


@interface MSServiceController : NSObject <UIApplicationDelegate>

+ (instancetype)defaultserviceController;

@property (nonatomic, strong) NSMutableDictionary *serviceSettings;

- (void)loadServices:(NSArray *)services;

- (void)loadService:(MSService *)service;
- (void)unloadService:(MSService *)service;

- (MSService *)getService:(Class)serviceClass;

- (void)autoDiscoverServices; //TODO


@end
