//
//  NSObject+MSRuntime.h
//  Pods
//
//  Created by ryan on 25/10/2016.
//
//

#import <Foundation/Foundation.h>

@protocol NSObjectExtend <NSObject>

- (double)performDoubleSelector:(SEL)aSelector;
- (NSInteger)performNSIntegerSelector:(SEL)aSelector;

#ifdef CGFLOAT_DEFINED
- (CGFloat)performCGFloatSelector:(SEL)aSelector;
#endif


@end

@interface NSObject (MSRuntime) <NSObjectExtend>

@end
