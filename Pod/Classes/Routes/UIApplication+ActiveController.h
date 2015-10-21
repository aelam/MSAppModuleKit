//
//  UIApplication+ActiveController.h
//  Pods
//
//  Created by ryan on 15/10/21.
//
//

#import <UIKit/UIKit.h>

@protocol UIApplicationRouter <NSObject>

- (UITabBarController *)tabBarController;
- (UINavigationController *)selectedNavigationController;
- (UIViewController *)topViewController;

@end



@interface UIApplication (ActiveController) <UIApplicationRouter>

@end
