//
//  JLRoutes+EMHelper.m
//  EMStock
//
//  Created by ryan on 6/1/16.
//  Copyright © 2016 flora. All rights reserved.
//

#import "JLRoutes+Finder.h"
#import "MSActiveControllerFinder.h"
#import "UIViewController+Routes.h"

@implementation JLRoutes (Finder)

- (void)registerRoute:(NSString *)path pushingControllerName:(NSString *)controllerName {
    [self registerRoute:path pushingControllerClass:NSClassFromString(controllerName)];
}

- (void)registerRoute:(NSString *)path presentingControllerName:(NSString *)controllerName {
    [self registerRoute:path presentingControllerClass:NSClassFromString(controllerName)];
}


- (void)registerRoute:(NSString *)path pushingControllerClass:(Class)controllerClass {
    [self addRoute:path handler:^BOOL (NSDictionary *parameters) {
        [MSActiveControllerFinder finder].resetStatus();
        UINavigationController *navigator = [MSActiveControllerFinder finder].activeNavigationController();
        [navigator pushViewControllerClass:controllerClass params:parameters];
        return YES;
    }];
}

- (void)registerRoute:(NSString *)path presentingControllerClass:(Class)controllerClass {
    [self addRoute:path handler:^BOOL (NSDictionary *parameters) {
        [MSActiveControllerFinder finder].resetStatus();
        UIViewController *topViewController = [MSActiveControllerFinder finder].activeTopController();
        [topViewController presentViewControllerClass:controllerClass params:parameters animated:YES completion:NULL];
        return YES;
    }];
}

@end
