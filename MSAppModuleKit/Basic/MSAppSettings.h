//
//  MSAppSettings.h
//  EMStock
//
//  Created by ryan on 15/11/5.
//  Copyright © 2015年 flora. All rights reserved.
//

#ifndef MSAppSettings_h
#define MSAppSettings_h


#import <Foundation/Foundation.h>

NS_SWIFT_NAME(MSAppSettingsProtocol)
@protocol MSAppSettings <NSObject>

@optional
@property (nonatomic, strong, readwrite) NSString *mainURLScheme;
@property (nonatomic, strong) NSArray<NSString *> *supportsURLSchemes;

@end


// @abstract
@interface MSAppSettings : NSObject <MSAppSettings>

// `+appSettings` is gone when converted to Swift
//
+ (instancetype)appSettings; // __deprecated;
+ (instancetype)sharedAppSettings;

@end

#endif
