//
//  MSSettingValues.h
//  Pods
//
//  Created by ryan on 25/10/2016.
//
//

#import <Foundation/Foundation.h>

NSString *MSPropertyStringValue(NSObject *object, SEL propertyGetter, NSString *defaultValue);
NSNumber *MSPropertyNumberValue(NSObject *object, SEL propertyGetter, NSNumber *defaultValue);
NSObject *MSPropertyObjectValue(NSObject *object, SEL propertyGetter, NSObject *defaultValue);

NSInteger MSPropertyIntegerValue(NSObject *object, SEL propertyGetter, NSInteger defaultValue);
double MSPropertyDoubleValue(NSObject *object, SEL propertyGetter, double defaultValue);

#ifdef CGFLOAT_DEFINED
CGFloat MSPropertyCGFloatValue(NSObject *object, SEL propertyGetter, CGFloat defaultValue);
#endif
