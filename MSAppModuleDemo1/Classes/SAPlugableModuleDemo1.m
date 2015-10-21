//
//  PlugableApp.m
//  AppSettings
//
//  Created by ryan on 15/8/10.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "SAPlugableModuleDemo1.h"

@implementation MSServiceDemo1

- (NSArray *)patterns {
    return nil;
}

- (NSString *)serviceName {
    return @"MSServiceDemo1";
}

- (NSString *)serviceIdentifier {
    return @"MSServiceDemo1";
}

- (NSString *)serviceVersion {
    return @"0.1.0";
}

- (NSArray *)pageMappings {
    return nil;
}

- (void)serviceDidLoad:(id)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)serviceDidUnload:(id)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

- (void)serviceDidEnterBackground:(id)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

- (void)serviceWillEnterForeground:(id)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

- (void)serviceWillTerminate:(id)info {
    NSLog(@"%@", NSStringFromSelector(_cmd));    
}

@end
