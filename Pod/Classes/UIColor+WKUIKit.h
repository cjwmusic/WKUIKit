//
//  UIColor+WKUIKit.h
//  Pods
//
//  Created by Wu Kong on 8/6/16.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (WKUIKit)

+ (UIColor *)colorWithHexString:(NSString *)colorString;
+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;

@end
