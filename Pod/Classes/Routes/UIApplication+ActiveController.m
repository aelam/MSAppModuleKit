//
//  UIApplication+ActiveController.m
//  Pods
//
//  Created by ryan on 15/10/21.
//
//

#import "UIApplication+ActiveController.h"

@implementation UIApplication (ActiveController)

- (UITabBarController *)tabBarController {
    UITabBarController *tabBarController = (UITabBarController *)self.keyWindow.rootViewController;
    if ([tabBarController isKindOfClass:[UITabBarController class]]) {
        return tabBarController;
    }
    return nil;
}

- (UINavigationController *)selectedNavigationController {
    UITabBarController *tabBarController = (UITabBarController *)self.keyWindow.rootViewController;
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

- (UIViewController *)topViewController {
    return [[self selectedNavigationController] topViewController];
}


@end
