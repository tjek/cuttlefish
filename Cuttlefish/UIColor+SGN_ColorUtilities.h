//
//  UIColor+SGN_ColorUtilities.h
//  Cuttlefish
//
//  Created by Laurie Hufford on 01/03/2016.
//  Copyright © 2016 ShopGun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (SGN_ColorUtilities)


/**
 *  The luminance of the reciever
 *  http://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef
 *
 *  @return A number defining the luminance of the reciever. 0 is dark, 1 is light
 */
- (CGFloat) sgn_luminance;


// Based on the `sgn_luminance`, and used by the `sgn_...TextColor` utilities
// The tipping-point is tweaked to make text look good on backgrounds
- (BOOL) sgn_isAlmostWhiteColor;
- (BOOL) sgn_isVeryLightColor;
- (BOOL) sgn_isLightColor;
- (BOOL) sgn_isAlmostBlackColor;




#pragma mark - Text Colors

// depending on the brightness of the color, either black or white text with varying alpha values
// https://www.google.com/design/spec/style/color.html#color-ui-color-application
@property (nonatomic, readonly) UIColor* sgn_primaryTextColor;
@property (nonatomic, readonly) UIColor* sgn_secondaryTextColor;
@property (nonatomic, readonly) UIColor* sgn_disabledTextColor;

+ (UIColor*) sgn_primaryTextColorOnLight:(BOOL)lightBG;
+ (UIColor*) sgn_secondaryTextColorOnLight:(BOOL)lightBG;
+ (UIColor*) sgn_disabledTextColorOnLight:(BOOL)lightBG;



#pragma mark - Hex conversion

+ (UIColor*) sgn_colorWithRGBHex:(UInt32)rgbHex;
+ (UIColor*) sgn_colorWithRGBAHex:(UInt32)rgbaHex;
+ (UIColor*) sgn_colorWithHexString:(NSString *)hexString;
+ (UIColor*) sgn_colorAndAlphaWithHexString:(NSString *)hexString;


#pragma mark - Equality
- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor;
- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor withTolerance:(CGFloat)tolerance;


@end
