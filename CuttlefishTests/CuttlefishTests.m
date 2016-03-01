//
//  CuttlefishTests.m
//  CuttlefishTests
//
//  Created by Laurie Hufford on 01/09/2015.
//  Copyright (c) 2015 ShopGun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIColor+SGN_ColorUtilities.h"
#import "UIColor+SGN_ColorPalette.h"


@interface CuttlefishTests : XCTestCase

@property (nonatomic) NSMutableDictionary* testShades;

@end

@implementation CuttlefishTests

- (void)setUp {
    [super setUp];
    
    // taken from https://www.google.com/design/spec/style/color.html#color-color-palette
    // TODO: move these to a stand-alone uicolor set
    _testShades = [NSMutableDictionary new];
    
    _testShades[@"Red"] = @{
                           @50: @"#FFEBEE",
                           @100: @"#FFCDD2",
                           @200: @"#EF9A9A",
                           @300: @"#E57373",
                           @400: @"#EF5350",
                           @500: @"#F44336",
                           @600: @"#E53935",
                           @700: @"#D32F2F",
                           @800: @"#C62828",
                           @900: @"#B71C1C",
                           };
    
    _testShades[@"Pink"] = @{
                            @50: @"#FCE4EC",
                            @100: @"#F8BBD0",
                            @200: @"#F48FB1",
                            @300: @"#F06292",
                            @400: @"#EC407A",
                            @500: @"#E91E63",
                            @600: @"#D81B60",
                            @700: @"#C2185B",
                            @800: @"#AD1457",
                            @900: @"#880E4F",
                            };
    
    _testShades[@"Purple"] = @{
                              @50: @"#F3E5F5",
                              @100: @"#E1BEE7",
                              @200: @"#CE93D8",
                              @300: @"#BA68C8",
                              @400: @"#AB47BC",
                              @500: @"#9C27B0",
                              @600: @"#8E24AA",
                              @700: @"#7B1FA2",
                              @800: @"#6A1B9A",
                              @900: @"#4A148C",
                              };
    
    _testShades[@"Deep Purple"] = @{
                                   @50: @"#EDE7F6",
                                   @100: @"#D1C4E9",
                                   @200: @"#B39DDB",
                                   @300: @"#9575CD",
                                   @400: @"#7E57C2",
                                   @500: @"#673AB7",
                                   @600: @"#5E35B1",
                                   @700: @"#512DA8",
                                   @800: @"#4527A0",
                                   @900: @"#311B92",
                                   };
    
    
    _testShades[@"Indigo"] = @{
                              @50: @"#E8EAF6",
                              @100: @"#C5CAE9",
                              @200: @"#9FA8DA",
                              @300: @"#7986CB",
                              @400: @"#5C6BC0",
                              @500: @"#3F51B5",
                              @600: @"#3949AB",
                              @700: @"#303F9F",
                              @800: @"#283593",
                              @900: @"#1A237E",
                              };
    
    _testShades[@"Blue"] = @{
                            @50: @"#E3F2FD",
                            @100: @"#BBDEFB",
                            @200: @"#90CAF9",
                            @300: @"#64B5F6",
                            @400: @"#42A5F5",
                            @500: @"#2196F3",
                            @600: @"#1E88E5",
                            @700: @"#1976D2",
                            @800: @"#1565C0",
                            @900: @"#0D47A1",
                            };
    
    
    _testShades[@"Light Blue"] = @{
                                  @50: @"#E1F5FE",
                                  @100: @"#B3E5FC",
                                  @200: @"#81D4FA",
                                  @300: @"#4FC3F7",
                                  @400: @"#29B6F6",
                                  @500: @"#03A9F4",
                                  @600: @"#039BE5",
                                  @700: @"#0288D1",
                                  @800: @"#0277BD",
                                  @900: @"#01579B",
                                  };
    
    
    _testShades[@"Cyan"] = @{
                            @50: @"#E0F7FA",
                            @100: @"#B2EBF2",
                            @200: @"#80DEEA",
                            @300: @"#4DD0E1",
                            @400: @"#26C6DA",
                            @500: @"#00BCD4",
                            @600: @"#00ACC1",
                            @700: @"#0097A7",
                            @800: @"#00838F",
                            @900: @"#006064",
                            };
    
    _testShades[@"Teal"] = @{
                            @50: @"#E0F2F1",
                            @100: @"#B2DFDB",
                            @200: @"#80CBC4",
                            @300: @"#4DB6AC",
                            @400: @"#26A69A",
                            @500: @"#009688",
                            @600: @"#00897B",
                            @700: @"#00796B",
                            @800: @"#00695C",
                            @900: @"#004D40",
                            };
    
    _testShades[@"Green"] = @{
                             @50: @"#E8F5E9",
                             @100: @"#C8E6C9",
                             @200: @"#A5D6A7",
                             @300: @"#81C784",
                             @400: @"#66BB6A",
                             @500: @"#4CAF50",
                             @600: @"#43A047",
                             @700: @"#388E3C",
                             @800: @"#2E7D32",
                             @900: @"#1B5E20",
                             };
    
    
    _testShades[@"Light Green"] = @{
                                   @50: @"#F1F8E9",
                                   @100: @"#DCEDC8",
                                   @200: @"#C5E1A5",
                                   @300: @"#AED581",
                                   @400: @"#9CCC65",
                                   @500: @"#8BC34A",
                                   @600: @"#7CB342",
                                   @700: @"#689F38",
                                   @800: @"#558B2F",
                                   @900: @"#33691E",
                                   };
    
    _testShades[@"Lime"] = @{
                            @50: @"#F9FBE7",
                            @100: @"#F0F4C3",
                            @200: @"#E6EE9C",
                            @300: @"#DCE775",
                            @400: @"#D4E157",
                            @500: @"#CDDC39",
                            @600: @"#C0CA33",
                            @700: @"#AFB42B",
                            @800: @"#9E9D24",
                            @900: @"#827717",
                            };
    
    _testShades[@"Yellow"] = @{
                              @50: @"#FFFDE7",
                              @100: @"#FFF9C4",
                              @200: @"#FFF59D",
                              @300: @"#FFF176",
                              @400: @"#FFEE58",
                              @500: @"#FFEB3B",
                              @600: @"#FDD835",
                              @700: @"#FBC02D",
                              @800: @"#F9A825",
                              @900: @"#F57F17",
                              };
    
    _testShades[@"Amber"] = @{
                             @50: @"#FFF8E1",
                             @100: @"#FFECB3",
                             @200: @"#FFE082",
                             @300: @"#FFD54F",
                             @400: @"#FFCA28",
                             @500: @"#FFC107",
                             @600: @"#FFB300",
                             @700: @"#FFA000",
                             @800: @"#FF8F00",
                             @900: @"#FF6F00",
                             };
    
    _testShades[@"Orange"] = @{
                              @50: @"#FFF3E0",
                              @100: @"#FFE0B2",
                              @200: @"#FFCC80",
                              @300: @"#FFB74D",
                              @400: @"#FFA726",
                              @500: @"#FF9800",
                              @600: @"#FB8C00",
                              @700: @"#F57C00",
                              @800: @"#EF6C00",
                              @900: @"#E65100",
                              };
    
    _testShades[@"Deep Orange"] = @{
                                   @50: @"#FBE9E7",
                                   @100: @"#FFCCBC",
                                   @200: @"#FFAB91",
                                   @300: @"#FF8A65",
                                   @400: @"#FF7043",
                                   @500: @"#FF5722",
                                   @600: @"#F4511E",
                                   @700: @"#E64A19",
                                   @800: @"#D84315",
                                   @900: @"#BF360C",
                                   };
    
    _testShades[@"Brown"] = @{
                             @50: @"#EFEBE9",
                             @100: @"#D7CCC8",
                             @200: @"#BCAAA4",
                             @300: @"#A1887F",
                             @400: @"#8D6E63",
                             @500: @"#795548",
                             @600: @"#6D4C41",
                             @700: @"#5D4037",
                             @800: @"#4E342E",
                             @900: @"#3E2723",
                             };
    
    _testShades[@"Grey"] = @{
                            @50: @"#FAFAFA",
                            @100: @"#F5F5F5",
                            @200: @"#EEEEEE",
                            @300: @"#E0E0E0",
                            @400: @"#BDBDBD",
                            @500: @"#9E9E9E",
                            @600: @"#757575",
                            @700: @"#616161",
                            @800: @"#424242",
                            @900: @"#212121",
                            };
    
    _testShades[@"Blue Grey"] = @{
                                 @50: @"#ECEFF1",
                                 @100: @"#CFD8DC",
                                 @200: @"#B0BEC5",
                                 @300: @"#90A4AE",
                                 @400: @"#78909C",
                                 @500: @"#607D8B",
                                 @600: @"#546E7A",
                                 @700: @"#455A64",
                                 @800: @"#37474F",
                                 @900: @"#263238",
                                 };
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGeneratedShadeAccuracy
{
    // given google's base 500 color, how does our generated compare to the ones Google provide
    
    __block CGFloat hDiffAvgMax = 0;
    __block CGFloat sDiffAvgMax = 0;
    __block CGFloat lDiffAvgMax = 0;
    
    __block CGFloat hDiffMaxMax = 0;
    __block CGFloat sDiffMaxMax = 0;
    __block CGFloat lDiffMaxMax = 0;

    [_testShades enumerateKeysAndObjectsUsingBlock:^(NSString* colorName, NSDictionary* shadeMap, BOOL *stop) {

        UIColor* baseColor = [UIColor sgn_colorWithHexString:shadeMap[@500]];
        

        
        CGFloat baseHue, baseLightness, baseSaturation, baseAlpha;
        [baseColor getHue:&baseHue saturation:&baseSaturation brightness:&baseLightness alpha:&baseAlpha];

        NSLog(@"%@", colorName);

        
        NSArray* sortedShadeNumbers = [shadeMap.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSNumber* key1, NSNumber* key2) {
            return [key1 compare:key2];
        }];

        
        CGFloat hDiffMax = 0;
        CGFloat sDiffMax = 0;
        CGFloat lDiffMax = 0;
        
        for (NSNumber* shadeNum in sortedShadeNumbers)
        {
            SGN_ColorPaletteShade shade = shadeNum.integerValue;
            
            
            // for reference
            
            UIColor* realColor = [UIColor sgn_colorWithHexString:shadeMap[shadeNum]];
            CGFloat rh, rs, rl, ra;
            [realColor getHue:&rh saturation:&rs brightness:&rl alpha:&ra];
            
            
            
            UIColor* generatedColor = [baseColor sgn_colorForShade:shade];
            CGFloat gh, gs, gl, ga;
            [generatedColor getHue:&gh saturation:&gs brightness:&gl alpha:&ga];
            
            
            // hue can loop back round on itself (eg. 0.9->0->0.1 = 0.1 diff
            CGFloat hDiff = fabs(rh-gh);
            if (hDiff > 0.5)
                hDiff = 1-hDiff;
            CGFloat sDiff = fabs(rs-gs);
            CGFloat lDiff = fabs(rl-gl);
            
            NSLog(@"  [%@] \th: %.2f%%  \ts: %.2f%%  \tl: %.2f%%", shadeNum, hDiff*100, sDiff*100, lDiff*100);
            
            
            hDiffMax = MAX(hDiff, hDiffMax);
            sDiffMax = MAX(sDiff, sDiffMax);
            lDiffMax = MAX(lDiff, lDiffMax);
            
            hDiffMaxMax = MAX(hDiff, hDiffMaxMax);
            sDiffMaxMax = MAX(sDiff, sDiffMaxMax);
            lDiffMaxMax = MAX(lDiff, lDiffMaxMax);
        }
        NSLog(@"   Max  \th: %.2f%%  \ts: %.2f%%  \tl: %.2f%%", hDiffMax*100, sDiffMax*100, lDiffMax*100);

        hDiffAvgMax += hDiffMax;
        sDiffAvgMax += sDiffMax;
        lDiffAvgMax += lDiffMax;
    }];
    
    hDiffAvgMax /= _testShades.count;
    sDiffAvgMax /= _testShades.count;
    lDiffAvgMax /= _testShades.count;
    
    CGFloat allDiffAvgMax = ((hDiffAvgMax + sDiffAvgMax + lDiffAvgMax)/3);
    
    NSLog(@"Max Max Diffs...");
    
    NSLog(@"  Hue:        \t%.2f%%", (hDiffMaxMax*100));
    NSLog(@"  Saturation: \t%.2f%%", (sDiffMaxMax*100));
    NSLog(@"  Lightness:  \t%.2f%%", (lDiffMaxMax*100));
    
    NSLog(@"Avg Max Diffs...");
    
    NSLog(@"  Hue:        \t%.2f%%", (hDiffAvgMax*100));
    NSLog(@"  Saturation: \t%.2f%%", (sDiffAvgMax*100));
    NSLog(@"  Lightness:  \t%.2f%%", (lDiffAvgMax*100));
    NSLog(@"  All:        \t%.2f%%", allDiffAvgMax*100);
    
    
    
    // assert that none of the differences go over regression boundaries
    XCTAssert(hDiffMaxMax < 0.0582);
    XCTAssert(sDiffMaxMax < 0.1023);
    XCTAssert(lDiffMaxMax < 0.5901); // <- the worst case is not very good! :(
    
    // assert that none of the averages go over regression boundaries
    XCTAssert(hDiffAvgMax < 0.0266);
    XCTAssert(sDiffAvgMax < 0.0529);
    XCTAssert(lDiffAvgMax < 0.2300); // <- the worst case is not very good! :(
    
    XCTAssert(allDiffAvgMax < 0.1032);
}

@end
