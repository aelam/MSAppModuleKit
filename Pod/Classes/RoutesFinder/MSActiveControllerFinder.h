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
typedef void (^FinderResetStatus)(void);


@protocol MSActiveControllerFinder <NSObject>

@property (nonatomic, copy) ActiveTopController activeTopController;
@property (nonatomic, copy) ActiveNavigationController activeNavigationController;
@property (nonatomic, copy) ActiveTabBarController activeTabBarController;
@property (nonatomic, copy) ActiveTabBarController rootTabBarController;
@property (nonatomic, copy) FinderResetStatus resetStatus;

@end

@interface MSActiveControllerFinder : NSObject <MSActiveControllerFinder>

+ (void)setFinder:(id<MSActiveControllerFinder>)finder;
+ (instancetype)finder;

@property (nonatomic, copy) ActiveTopController activeTopController;
@property (nonatomic, copy) ActiveNavigationController activeNavigationController;
@property (nonatomic, copy) ActiveTabBarController activeTabBarController;
@property (nonatomic, copy) ActiveTabBarController rootTabBarController;
@property (nonatomic, copy) FinderResetStatus resetStatus;

@end
