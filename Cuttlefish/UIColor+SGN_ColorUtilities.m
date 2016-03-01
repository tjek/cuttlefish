//
//  UIColor+SGN_ColorUtilities.m
//  Cuttlefish
//
//  Created by Laurie Hufford on 01/03/2016.
//  Copyright © 2016 ShopGun. All rights reserved.
//

#import "UIColor+SGN_ColorUtilities.h"

@implementation UIColor (SGN_ColorUtilities)

#pragma mark - Luminance

- (CGFloat) sgn_luminance
{
    CGFloat r,g,b;
    if (![self getRed:&r green:&g blue:&b alpha:nil])
        return 0.0f;
    
    // http://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef
    // http://en.wikipedia.org/wiki/Luma_(video)
    // Y = 0.2126 R + 0.7152 G + 0.0722 B
    
    r = r < 0.03928 ? r / 12.92 : powf((r + 0.055) / 1.055, 2.4);
    g = g < 0.03928 ? g / 12.92 : powf((g + 0.055) / 1.055, 2.4);
    b = b < 0.03928 ? b / 12.92 : powf((b + 0.055) / 1.055, 2.4);
    
    return r*0.2126f + g*0.7152f + b*0.0722f;
}

- (BOOL) sgn_isAlmostWhiteColor
{
    return self.sgn_luminance > 0.95;
}

- (BOOL) sgn_isVeryLightColor
{
    return self.sgn_luminance > 0.87;
}

- (BOOL) sgn_isLightColor
{
    return self.sgn_luminance > 0.54;
}

- (BOOL) sgn_isAlmostBlackColor
{
    return self.sgn_luminance < 0.025;
}






#pragma mark - Text Color

+ (UIColor*) sgn_primaryTextColorOnLight:(BOOL)lightBG
{
    return lightBG ? [UIColor colorWithWhite:0 alpha:0.87] : [UIColor colorWithWhite:1 alpha:1.0];
}
+ (UIColor*) sgn_secondaryTextColorOnLight:(BOOL)lightBG
{
    return lightBG ? [UIColor colorWithWhite:0 alpha:0.54] : [UIColor colorWithWhite:1 alpha:0.7];
}
+ (UIColor*) sgn_disabledTextColorOnLight:(BOOL)lightBG
{
    return lightBG ? [UIColor colorWithWhite:0 alpha:0.38] : [UIColor colorWithWhite:1 alpha:0.3];
}


// depending on the brightness of the color, either black or white text with varying alpha values
- (UIColor*) sgn_primaryTextColor
{
    return [self.class sgn_primaryTextColorOnLight:[self sgn_isLightColor]];
}
- (UIColor*) sgn_secondaryTextColor
{
    return [self.class sgn_secondaryTextColorOnLight:[self sgn_isLightColor]];
}
- (UIColor*) sgn_disabledTextColor
{
    return [self.class sgn_disabledTextColorOnLight:[self sgn_isLightColor]];
}





#pragma mark - Hex conversion

+ (UIColor *) sgn_colorWithRGBHex:(UInt32)rgbHex
{
    int r = (rgbHex >> 16) & 0xFF;
    int g = (rgbHex >> 8) & 0xFF;
    int b = (rgbHex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}
+ (UIColor *) sgn_colorWithRGBAHex:(UInt32)rgbaHex
{
    int r = (rgbaHex >> 24) & 0xFF;
    int g = (rgbaHex >> 16) & 0xFF;
    int b = (rgbaHex >> 8) & 0xFF;
    int a = (rgbaHex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.0f];
}


+ (UIColor *)sgn_colorWithHexString:(NSString *)hexString
{
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }

    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [UIColor sgn_colorWithRGBHex:hexNum];
}
+ (UIColor*) sgn_colorAndAlphaWithHexString:(NSString *)hexString
{
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [UIColor sgn_colorWithRGBAHex:hexNum];
}









#pragma mark - Equality

- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor
{
#if CGFLOAT_IS_DOUBLE
    CGFloat tolerance = DBL_EPSILON;
#else
    CGFloat tolerance = FLT_EPSILON;
#endif
    return [self sgn_isEqualToColor:otherColor withTolerance:tolerance];
}

- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor withTolerance:(CGFloat)tolerance
{
    if (self == otherColor)
        return YES;
    
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [otherColor getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    return fabs(r1 - r2) <= tolerance &&
    fabs(g1 - g2) <= tolerance &&
    fabs(b1 - b2) <= tolerance &&
    fabs(a1 - a2) <= tolerance;
}


@end
