//
//  NSObject+MSRuntime.m
//  Pods
//
//  Created by ryan on 25/10/2016.
//
//

#import "NSObject+MSRuntime.h"

@implementation NSObject (MSRuntime)

- (double)performDoubleSelector:(SEL)aSelector {
    NSInvocation *invocation = [self ms_invokeSelector:aSelector];
    double f = 0.0f;
    [invocation getReturnValue:&f];
    return f;
}

- (NSInteger)performNSIntegerSelector:(SEL)aSelector {
    NSInvocation *invocation = [self ms_invokeSelector:aSelector];
    NSInteger f = 0;
    [invocation getReturnValue:&f];
    return f;
}

#ifdef CGFLOAT_DEFINED
- (CGFloat)performCGFloatSelector:(SEL)aSelector {
    NSInvocation *invocation = [self ms_invokeSelector:aSelector];
    CGFloat f = 0.0f;
    [invocation getReturnValue:&f];
    return f;
}
#endif

- (NSInvocation *)ms_invokeSelector:(SEL)aSelector {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:aSelector]];
    [invocation setSelector:aSelector];
    [invocation setTarget:self];
    [invocation invoke];

    return invocation;
}

@end
