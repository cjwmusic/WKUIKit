//
//  UIColor+WKUIKit.m
//  Pods
//
//  Created by Wu Kong on 8/6/16.
//
//

#import "UIColor+WKUIKit.h"
#import "HexColors.h"

@implementation UIColor (WKUIKit)

+ (UIColor *)colorWithHexString:(NSString *)colorString {
    return [UIColor hx_colorWithHexString:colorString];
}

+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha {
    return [UIColor hx_colorWithHexString:colorString alpha:alpha];
}

@end
