//
//  MSActiveControllerFinder.m
//  EMStock
//
//  Created by ryan on 3/10/16.
//  Copyright © 2016 flora. All rights reserved.
//

#import "MSActiveControllerFinder.h"

static MSActiveControllerFinder *finder = nil;

@implementation MSActiveControllerFinder

+ (void)setFinder:(id<MSActiveControllerFinder>)aFinder {
    finder = aFinder;
}

+ (instancetype)finder {
    if (finder) {
        return finder;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        finder = [[self alloc] init];
    });
    return finder;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpDefaultActiveTabBarController];
        [self setUpDefaultActiveNavigationController];
        [self setUpDefaultActiveTopViewController];
        [self setUpDefaultResetStatus];
    }
    return self;
}

- (void)setUpDefaultActiveTabBarController {
    __weak __typeof(self)weakSelf = self;
    self.activeTabBarController = ^ UITabBarController * {
        return [weakSelf defaultActiveTabBarController];
    };
}

- (void)setUpDefaultActiveNavigationController {
    __weak __typeof(self)weakSelf = self;
    self.activeNavigationController = ^ UINavigationController *{
        return [weakSelf defaultActiveNavigationController];
    };
}

- (void)setUpDefaultActiveTopViewController {
    __weak __typeof(self)weakSelf = self;
    self.activeTopController = ^UIViewController * {
        return [weakSelf defaultActiveTopController];
    };
}

- (void)setUpDefaultResetStatus {
    self.resetStatus = ^{
    };
 }


- (UITabBarController *)defaultActiveTabBarController {
    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([tabBarController isKindOfClass:[UITabBarController class]]) {
        return tabBarController;
    }
    return nil;
}

- (UINavigationController *)defaultActiveNavigationController {
    UITabBarController *tabBarController = [self defaultActiveTabBarController];
    if ([tabBarController isKindOfClass:[UITabBarController class]]) {
        UINavigationController *navigationController = [tabBarController selectedViewController];
        if ([navigationController isKindOfClass:[UINavigationController class]]) {
            return navigationController;
        }
        return nil;
    } else if ([tabBarController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navi = (UINavigationController *)tabBarController;
        return navi;
    }
    return nil;
}

- (UIViewController *)defaultActiveTopController {
    return [[self defaultActiveNavigationController] topViewController];

}


@end
