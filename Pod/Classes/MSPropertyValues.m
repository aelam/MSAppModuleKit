//
//  MSSettingValues.m
//  Pods
//
//  Created by ryan on 25/10/2016.
//
//

#import "MSPropertyValues.h"
#import "NSObject+MSRuntime.h"

NSString *MSPropertyStringValue(NSObject *object, SEL propertyGetter, NSString *defaultValue) {
    return (NSString *)MSPropertyObjectValue(object, propertyGetter, defaultValue);
}

NSNumber *MSPropertyNumberValue(NSObject *object, SEL propertyGetter, NSNumber *defaultValue) {
    return (NSNumber *)MSPropertyObjectValue(object, propertyGetter, defaultValue);
}

NSObject *MSPropertyObjectValue(NSObject *object, SEL propertyGetter, NSObject *defaultValue) {
    if([object respondsToSelector:propertyGetter]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [object performSelector:propertyGetter];
#pragma clang diagnostic pop
    }
    return defaultValue;
}


double MSPropertyDoubleValue(NSObject *object, SEL propertyGetter, double defaultValue) {
    if([object respondsToSelector:propertyGetter]) {
        return [(id<NSObjectExtend>)object performDoubleSelector:propertyGetter];
    }
    return defaultValue;
}

NSInteger MSPropertyIntegerValue(NSObject *object, SEL propertyGetter, NSInteger defaultValue) {
    if([object respondsToSelector:propertyGetter]) {
        return [(id<NSObjectExtend>)object performNSIntegerSelector:propertyGetter];
    }
    return defaultValue;
}

#ifdef CGFLOAT_DEFINED
CGFloat MSPropertyCGFloatValue(NSObject *object, SEL propertyGetter, CGFloat defaultValue) {
    if([object respondsToSelector:propertyGetter]) {
        return [(id<NSObjectExtend>)object performCGFloatSelector:propertyGetter];
    }
    return defaultValue;
}
#endif
