//
//  _____ _           _____
// |   __| |_ ___ ___|   __|_ _ ___
// |__   |   | . | . |  |  | | |   |
// |_____|_|_|___|  _|_____|___|_|_|
//               |_|
//
//  Copyright (c) 2015 ShopGun. All rights reserved.


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SGN_ColorPaletteShade)
{
    SGN_ColorPaletteShade_50         = 50,  // lightest
    SGN_ColorPaletteShade_100        = 100, // ...
    SGN_ColorPaletteShade_200        = 200, // ...
    SGN_ColorPaletteShade_300        = 300, // ...
    SGN_ColorPaletteShade_400        = 400, // light
    
    SGN_ColorPaletteShade_600        = 600, // dark
    SGN_ColorPaletteShade_700        = 700, // ...
    SGN_ColorPaletteShade_800        = 800, // ...
    SGN_ColorPaletteShade_900        = 900, // darkest
};


@interface UIColor (SGN_ColorPalette)

// calculate a shade, where the receiver is the base (500) color
- (UIColor*) sgn_colorForShade:(SGN_ColorPaletteShade)shade;



// depending on the brightness of the color, either black or white text with varying alpha values
// https://www.google.com/design/spec/style/color.html#color-ui-color-application
@property (nonatomic, readonly) UIColor* sgn_primaryTextColor;
@property (nonatomic, readonly) UIColor* sgn_secondaryTextColor;
@property (nonatomic, readonly) UIColor* sgn_disabledTextColor;


// Based on the `sg_luminance`, and used by the `sgn_...TextColor` utilities
// The tipping-point is tweaked to make text look good on backgrounds
- (BOOL) sgn_isLightColor;




- (CGFloat) sgn_luminance;

- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor;
- (BOOL) sgn_isEqualToColor:(UIColor *)otherColor withTolerance:(CGFloat)tolerance;

@end


