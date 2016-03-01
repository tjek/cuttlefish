//
//  ViewController.m
//  Cuttlefish
//
//  Created by Laurie Hufford on 01/09/2015.
//  Copyright (c) 2015 ShopGun. All rights reserved.
//

#import "ViewController.h"

#import "ColorPaletteTableViewCell.h"

#import "SGN_Cuttlefish.h"

// for testing colors
#import "UIColor+SGN_FlatColors.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary* namedColors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.namedColors = @{
                    @"turquoise": [UIColor turquoiseColor],
                    @"emerald": [UIColor emeraldColor],
                    @"peter River": [UIColor peterRiverColor],
                    @"amethyst": [UIColor amethystColor],
                    @"wet Asphalt": [UIColor wetAsphaltColor],
                    @"green Sea": [UIColor greenSeaColor],
                    @"nephritis": [UIColor nephritisColor],
                    @"belizeHole": [UIColor belizeHoleColor],
                    @"wisteria": [UIColor wisteriaColor],
                    @"midnight Blue": [UIColor midnightBlueColor],
                    @"sunFlower": [UIColor sunFlowerColor],
                    @"carrot": [UIColor carrotColor],
                    @"alizarin": [UIColor alizarinColor],
                    @"clouds": [UIColor cloudsColor],
                    @"concrete": [UIColor concreteColor],
                    @"orangey": [UIColor orangeyColor],
                    @"pumpkin": [UIColor pumpkinColor],
                    @"pomegranate": [UIColor pomegranateColor],
                    @"silver": [UIColor silverColor],
                    @"asbestos": [UIColor asbestosColor],
                    
                    // system colors
                    @"black": [UIColor blackColor],
                    @"dark Gray": [UIColor darkGrayColor],
                    @"light Gray": [UIColor lightGrayColor],
                    @"white": [UIColor whiteColor],
                    @"gray": [UIColor grayColor],
//                    @"red": [UIColor redColor],
//                    @"green": [UIColor greenColor],
//                    @"blue": [UIColor blueColor],
//                    @"cyan": [UIColor cyanColor],
//                    @"yellow": [UIColor yellowColor],
//                    @"magenta": [UIColor magentaColor],
//                    @"orange": [UIColor orangeColor],
//                    @"purple": [UIColor purpleColor],
//                    @"brown": [UIColor brownColor],
//                    @"clear": [UIColor clearColor],
                    };
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.namedColors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorPaletteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SGN_ColorPaletteCell" forIndexPath:indexPath];
    
    NSString* colorName = [self.namedColors.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)][indexPath.row];
    
    UIColor* color = self.namedColors[colorName];
    
    
    cell.contentView.backgroundColor = color;
    
    cell.primaryTextLabel.textColor = color.sgn_primaryTextColor;
    cell.secondaryTextLabel.textColor = color.sgn_secondaryTextColor;
    cell.disabledTextLabel.textColor = color.sgn_disabledTextColor;
    
    
    CGFloat h,s,l;
    [color getHue:&h saturation:&s brightness:&l alpha:NULL];
    
    CGFloat r,g,b;
    [color getRed:&r green:&g blue:&b alpha:NULL];
    
    cell.primaryTextLabel.text = [colorName capitalizedString];
    cell.secondaryTextLabel.text = [NSString stringWithFormat:@"HSL(%.2f, %.2f, %.2f)", h, s, l];
    cell.disabledTextLabel.text = [NSString stringWithFormat:@"RGB(%.2f, %.2f, %.2f)", r, g, b];
    
    NSArray* shades = @[@(SGN_ColorPaletteShade_900),
                        @(SGN_ColorPaletteShade_800),
                        @(SGN_ColorPaletteShade_700),
                        @(SGN_ColorPaletteShade_600),
                        @(SGN_ColorPaletteShade_400),
                        @(SGN_ColorPaletteShade_300),
                        @(SGN_ColorPaletteShade_200),
                        @(SGN_ColorPaletteShade_100),
                        @(SGN_ColorPaletteShade_50),];
    for (NSNumber* shadeNum in shades)
    {
        // generate a color for the shade
        SGN_ColorPaletteShade shade = shadeNum.integerValue;
        UIColor* shadeColor = [color sgn_colorForShade:shade];
        
        UIView* shadeView = [cell.shadesView viewWithTag:shade];
        [shadeView setBackgroundColor:shadeColor];
    }
    
    return cell;
}

@end
