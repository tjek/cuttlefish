//
//  _____ _           _____
// |   __| |_ ___ ___|   __|_ _ ___
// |__   |   | . | . |  |  | | |   |
// |_____|_|_|___|  _|_____|___|_|_|
//               |_|
//
//  Copyright (c) 2015 ShopGun. All rights reserved.


#import "UIColor+SGN_ColorPalette.h"


CGFloat sgn_getModifiedHueForShade(CGFloat baseHue, SGN_ColorPaletteShade shade)
{
    CGFloat hue = baseHue;
    
    // darker shade - decrease hue
    if (shade > 500)
    {
        CGFloat hueAt900 = (1.003*baseHue) - 0.016;
        
        // lerp shade 500->900
        hue = ((hueAt900 - baseHue)/(900-500))*(shade-500) + baseHue;
    }
    
    return MIN(MAX(hue, 0), 1);
}
CGFloat sgn_getModifiedSaturationForShade(CGFloat baseSaturation, SGN_ColorPaletteShade shade)
{
    CGFloat sat = baseSaturation;
    
    // brighter shade - decrease saturation
    if (shade < 500)
    {
        // get the saturation target @ 50:
        // clamp to 0.0
        CGFloat satAt50 = MAX((0.136 * baseSaturation) - 0.025, 0.0);
        
        // lerp shade 500->900
        sat = ((baseSaturation - satAt50)/(500-50))*(shade-50) + satAt50;
    }
    // darker shade - increase saturation
    else if (shade > 500)
    {
        // get the saturation target @ 900:
        // quick inaccurate version:
        // 110% of the base saturation (clamped to 1.0)
        //            CGFloat satAt900 = MIN(baseSaturation * 1.10, 1.0);
        
        // expensive(?) accurate version
        CGFloat satAt900 = MIN((-1.019*baseSaturation*baseSaturation)+(2.283*baseSaturation)-0.281, 1.0);
        
        // lerp shade 500->900
        sat = ((satAt900 - baseSaturation)/(900-500))*(shade-500) + baseSaturation;
    }
    
    return MIN(MAX(sat, 0), 1);
}

CGFloat sgn_getModifiedBrightnessForShade(CGFloat baseBrightness, SGN_ColorPaletteShade shade)
{
    CGFloat brightnessPercentage = 0;
    
    // We have modifier-percentages that map to shades.
    // Use this list to find the matching percentage, or lerp if the shade is not on a x100 bounds
    NSArray* percentageRanges = @[@1.06, //0 - lerp from 50&100
                                  //@0.88, //50
                                  @0.70, //100
                                  @0.50, //200
                                  @0.30, //300
                                  @0.15, //400
                                  @0.00, //500
                                  @-0.10, //600
                                  @-0.25, //700
                                  @-0.42, //800
                                  @-0.59, //900
                                  ];
    
    CGFloat indexFloat = ((CGFloat)shade)/100.0;
    
    NSInteger lowerIndex = MIN(MAX((NSInteger)floor(indexFloat), 0), percentageRanges.count-1);
    NSInteger upperIndex = MIN(MAX((NSInteger)ceil(indexFloat), 0), percentageRanges.count-1);
    
    CGFloat lowerPercentage = [percentageRanges[lowerIndex] floatValue];
    
    if (lowerIndex!=upperIndex)
    {
        CGFloat upperPercentage = [percentageRanges[upperIndex] floatValue];
        
        // lerp the index
        brightnessPercentage = lowerPercentage + ((upperPercentage-lowerPercentage) / ((CGFloat)upperIndex-(CGFloat)lowerIndex)) * (indexFloat-(CGFloat)lowerIndex);
    }
    else
    {
        brightnessPercentage = lowerPercentage;
    }
    
    
    CGFloat brightness = baseBrightness;
    
    // brighter shade
    if (shade < 500)
    {
        brightness = baseBrightness + ((1.0-baseBrightness)*brightnessPercentage);
    }
    // darker shade
    else if (shade > 500)
    {
        brightness = baseBrightness + (baseBrightness*brightnessPercentage);
    }
    
    return MIN(MAX(brightness, 0), 1);
}




@implementation UIColor (SGN_ColorPalette)

- (UIColor*) sgn_colorForShade:(SGN_ColorPaletteShade)shade
{
    if (shade == 500)
        return self;
    
    CGFloat baseHue, baseBrightness, baseSaturation, baseAlpha;
    [self getHue:&baseHue saturation:&baseSaturation brightness:&baseBrightness alpha:&baseAlpha];
    
    // generate new saturation
    CGFloat hue = sgn_getModifiedHueForShade(baseHue, shade);
    CGFloat sat = sgn_getModifiedSaturationForShade(baseSaturation, shade);
    CGFloat bright = sgn_getModifiedBrightnessForShade(baseBrightness, shade);
    
    UIColor* modifiedColor = [UIColor colorWithHue:hue saturation:sat brightness:bright alpha:baseAlpha];
    return modifiedColor;
}

@end
