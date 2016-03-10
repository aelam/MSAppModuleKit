//
//  MSActiveControllerFinder.h
//  EMStock
//
//  Created by ryan on 3/10/16.
//  Copyright © 2016 flora. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef UIViewController *(^ActiveTopController)(void);
typedef UINavigationController *(^ActiveNavigationController)(void);
typedef UITabBarController *(^ActiveTabBarController)(void);


@protocol MSActiveControllerFinder <NSObject>

@property (nonatomic, copy) ActiveTopController activeTopController;
@property (nonatomic, copy) ActiveNavigationController activeNavigationController;
@property (nonatomic, copy) ActiveTabBarController activeTabBarController;

@end

@interface MSActiveControllerFinder : NSObject <MSActiveControllerFinder>

+ (void)setFinder:(id<MSActiveControllerFinder>)finder;
+ (instancetype)finder;

@property (nonatomic, copy) ActiveTopController activeTopController;
@property (nonatomic, copy) ActiveNavigationController activeNavigationController;
@property (nonatomic, copy) ActiveTabBarController activeTabBarController;

@end
